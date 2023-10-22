//
//  KisiDetay.swift
//  KisilerUygulaması
//
//  Created by Hakan Sezer on 22.10.2023.
//

import UIKit

class KisiDetay: UIViewController {
    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    var kisi: Kisiler?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let k = kisi {
            tfKisiAd.text = k.kisiAd
            tfKisiTel.text = k.kisiTel
        }
    }
    
    
    //MARK: - Actions
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let ka = tfKisiAd.text, let kt = tfKisiTel.text , let k = kisi {
            //kisiID'yi kisiler class'ı içerisinden almış olduk.
            guncelle(kisiID: k.kisiID!, kisiAd: ka, kisiTel: kt)
        }
    }
    
    // MARK: - Functions
    
    // Bu kendi içerisinde kullanabileceğimiz bir fonksiyon haline getirmiş olacağız.
    func guncelle(kisiID: Int,kisiAd: String, kisiTel: String) {
        print("Kişi guncelle: \(kisiID) -\(kisiAd) - \(kisiTel)")
    }
}
