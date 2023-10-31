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
    
    let db:FMDatabase?
    
    init() {
        // Veri telefonu içerisinde kayıt yeri seçiliyor. Uygulama içerisinde dosya yolu
            let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        // hedef yolla kopyalanacak yer oluşuyor. Kopyalacak yeri oluşturuyoruz.
            let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        // Bu nesne Veri tabanına erişimi sağlayacak.
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    // Kisiler Kayit İşlemi üzerinden oluyor. KisiKayitView
    func kaydet(kisiAd: String, kisiTel: String) {
        db?.open()
        
        do {
            let rs = try db!.executeQuery("INSERT INTO kisiler (kisiAd,kisiTel) VALUES (?,?)", values: [kisiAd,kisiTel])
            
            
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    //KisiDetayViewModel
    func guncelle(kisiID: Int,kisiAd: String, kisiTel: String) {
        db?.open()
        
        do {
            let rs = try db!.executeQuery("UPDATE kisiler SET kisiAd = ?, kisiTel = ? WHERE kisiID = ?", values: [kisiAd,kisiTel,kisiID])
            
            
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    //AnasayfaView
    func sil(kisiID: Int) {
        db?.open()
        
        do {
            let rs = try db!.executeQuery("DELETE FROM kisiler WHERE kisiID = ?", values: [kisiID])
            // bu son verileri görmemizi sağlayacaklardan.
            // Arayüzden kaybolması için kullanılır.
            kisilerYukle()
            
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
       
        
    }
    
    //AnaSayfaView
    func ara(aramaKelimesi: String) {
        db?.open()
        var liste = [Kisiler]()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM kisiler WHERE kisiAd like '%\(aramaKelimesi)%'", values: nil)
            // While Döngüsü kaç satır varsa o kadar kişiyi vermiş olacack.
            while rs.next() {
                let kisi = Kisiler(kisiID: Int(rs.string(forColumn: "kisiID"))!,kisiAd: rs.string(forColumn: "kisiAd")!,kisiTel: rs.string(forColumn: "kisiTel")!)
                liste.append(kisi)
            }
            kisilerListesi.onNext(liste) // Tetikleme.
        }catch {
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
    func kisilerYukle() {
        db?.open()
        var liste = [Kisiler]()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            // While Döngüsü kaç satır varsa o kadar kişiyi vermiş olacack.
            while rs.next() {
                let kisi = Kisiler(kisiID: Int(rs.string(forColumn: "kisiID"))!,kisiAd: rs.string(forColumn: "kisiAd")!,kisiTel: rs.string(forColumn: "kisiTel")!)
                liste.append(kisi)
            }
            kisilerListesi.onNext(liste) // Tetikleme.
        }catch {
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
}
