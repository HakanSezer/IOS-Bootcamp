//
//  ViewController.swift
//  UserDefaultKullanimi
//
//  Created by Hakan Sezer on 31.10.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelSayac: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Tanımlama
        let ud = UserDefaults.standard
        
        // Kayıt
        ud.set("Ahmet", forKey: "ad")
        ud.set(23, forKey: "yas")
        ud.set(1.78, forKey: "boy")
        ud.set(true, forKey: "bekar")
        
        let liste = ["ali", "ece"]
        ud.set(liste, forKey: "liste")
        
                
        // Silme
        //ud.removeObject(forKey: "ad")
        
        // Okuma
        let gelenAd = ud.string(forKey: "ad") ?? "isim yok."
        let gelenYas = ud.integer(forKey: "yas")
        let gelenBoy = ud.double(forKey: "boy")
        let gelenBekar = ud.bool(forKey: "bekar")
        
        print("Gelen Ad : \(gelenAd)")
        print("Gelen Yas : \(gelenYas)")
        print("Gelen Boy : \(gelenBoy)")
        print("Gelen Bekar : \(gelenBekar)")
        
        let gelenListe = ud.array(forKey: "liste") ?? [String]()
        
        for a in gelenListe {
            print("Gelen Liste : \(a)")
        }
        
        let sehirlerH = ["16":"Bursa","34":"Istanbul"]

        let gelenSehirler = ud.dictionary(forKey: "sehirlerH") ?? [String:String]()
        
        for (anahtar,deger) in gelenSehirler {
            print("Gelen Şehir: \(anahtar) -> \(deger)")
        }
        
        
        // Sayaç Uygulaması
        var sayac = ud.integer(forKey: "sayac")
        
        sayac += 1
        
        ud.set(sayac, forKey: "sayac")
        
        labelSayac.text = "Açılış Sayisi : \(sayac)"
    }


}

