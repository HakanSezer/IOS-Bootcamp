//
//  KisilerDaoRepository.swift
//  KisilerUygulaması
//
//  Created by Hakan Sezer on 30.10.2023.
//

import Foundation
import RxSwift
import CoreData

class KisilerDaoRepository {
    
    var kisilerListesi = BehaviorSubject<[KisilerModel]>(value: [KisilerModel]())
    
    // Bu veri tabanına erişme yetkisi.
    let context = appDelegate.persistentContainer.viewContext
    
    // Kisiler Kayit İşlemi üzerinden oluyor. KisiKayitView
    func kaydet(kisi_ad: String, kisi_tel: String) {
        // Birtane nesne oluşturuyoruz.
        let kisi = KisilerModel(context: context)
        kisi.kisi_ad = kisi_ad
        kisi.kisi_tel = kisi_tel
        
        //bunula appdelegate içerisine kayıt ediyoruz
        
        appDelegate.saveContext()
        
    }
    
    //KisiDetayViewModel
    func guncelle(kisi: KisilerModel,kisi_ad: String, kisi_tel: String) {
        kisi.kisi_ad = kisi_ad
        kisi.kisi_tel = kisi_tel
        
        appDelegate.saveContext()
    }
    
    //AnasayfaView
    func sil(kisi: KisilerModel) {
        //contextten silmeyi istiyoruz.
        context.delete(kisi)
        // Kayıt ediyoruz.
        appDelegate.saveContext()
        // bu son verileri görmemizi sağlayacaklardan.
        kisilerYukle()
    }
    
    //AnaSayfaView
    func ara(aramaKelimesi: String) {
        do {
            let fr = KisilerModel.fetchRequest()
            fr.predicate = NSPredicate(format: "kisi_ad CONTAINS[c] %@", aramaKelimesi)
            
            let liste = try context.fetch(fr)
            kisilerListesi.onNext(liste) // Tetikleme.
        }catch{
            print(error.localizedDescription)
        }
    }
    
    // Anasayfadan gelen veriler ilk başta AnaSayfa -> AnaSayfaViewModel -> KisilerDaoRepository üzerine gidiyor ve daha sonra bunu üzerinden dönüyor.
    func kisilerYukle() {
        do {
            let liste = try context.fetch(KisilerModel.fetchRequest())
            kisilerListesi.onNext(liste) // Tetikleme.
        }catch{
            print(error.localizedDescription)
        }
    }
    
}
