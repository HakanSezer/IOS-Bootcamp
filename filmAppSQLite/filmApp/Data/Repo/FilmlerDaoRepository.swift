//
//  FilmlerDaoRepository.swift
//  filmApp
//
//  Created by Hakan Sezer on 31.10.2023.
//

import Foundation
import RxSwift

class FilmlerDaoRepository {
 
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
    
    // Bu bizim veri tabanına erişim datamız olacak.
    let db:FMDatabase?
    
    init(){
        // Bizim Hedefte nereye kopyalacağımızı seçtiğimiz yer.
        // Genel yola erişiyoruz. Hedef yol ile sonra
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        // Sonra kopyalama yapılacak yere erişiyoruz. hedef yoluyl yapıyoruz bunu
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler_app.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func filmleriYukle() {
        
        db?.open()
        var liste = [Filmler]()
        do {
            let rs = try db!.executeQuery("SELECT * FROM filmler", values: nil)
            
            // Satırları sırayla okumasını sağlıyoruz.
            while rs.next() {
                let film = Filmler(id: Int(rs.string(forColumn: "id"))!,
                                   ad: rs.string(forColumn: "ad")!,
                                   resim: rs.string(forColumn: "resim")!,
                                   fiyat: Int(rs.string(forColumn: "fiyat"))!)
                liste.append(film)
            }
            // Bununla arayüze gönderecek.
            // geri dönüş tetiklenmesi yaratır. Bununla AnaSayfaViewModel'daki init içindeki filmlerListesini tetikler
            filmlerListesi.onNext(liste)
        }catch {
            
        }
        
        
        
        
        
        // kapatma olmadan performans olumsuz etkilenir.
        db?.close()
    }
}
