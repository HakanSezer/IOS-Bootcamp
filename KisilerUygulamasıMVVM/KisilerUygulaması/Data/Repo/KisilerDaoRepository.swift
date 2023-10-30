//
//  KisilerDaoRepository.swift
//  KisilerUygulaması
//
//  Created by Hakan Sezer on 30.10.2023.
//

import Foundation
import RxSwift

class KisilerDaoRepository {
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    // Kisiler Kayit İşlemi üzerinden oluyor. KisiKayitView
    func kaydet(kisiAd: String, kisiTel: String) {
        print("Kişi Kaydet: \(kisiAd) - \(kisiTel)")
    }
    
    //KisiDetayViewModel
    func guncelle(kisiID: Int,kisiAd: String, kisiTel: String) {
        print("Kişi guncelle: \(kisiID) -\(kisiAd) - \(kisiTel)")
    }
    //AnasayfaView
    func sil(kisiID: Int) {
        print("Seçildi: \(kisiID)")
        // bu son verileri görmemizi sağlayacaklardan.
        kisilerYukle()
    }
    
    //AnaSayfaView
    func ara(aramaKelimesi: String) {
        print("Kişi Ara : \(aramaKelimesi)")
    }
    
    func kisilerYukle() {
        var liste = [Kisiler]()
        
        let k1 = Kisiler(kisiID: 1, kisiAd: "Ahmet", kisiTel: "0541231256")
        let k2 = Kisiler(kisiID: 2, kisiAd: "Beyza", kisiTel: "05134647256")
        let k3 = Kisiler(kisiID: 3, kisiAd: "Zeynep", kisiTel: "464356437")
        liste.append(k1)
        liste.append(k2)
        liste.append(k3)
        kisilerListesi.onNext(liste) // Tetikleme. 
    }
    
}
