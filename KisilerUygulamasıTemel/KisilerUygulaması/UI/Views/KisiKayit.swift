//
//  KisiKayit.swift
//  KisilerUygulaması
//
//  Created by Hakan Sezer on 22.10.2023.
//

import UIKit

class KisiKayit: UIViewController {
    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Actions
    @IBAction func buttonKaydet(_ sender: Any) {
        if let ka = tfKisiAd.text, let kt = tfKisiTel.text {
            kaydet(kisiAd: ka, kisiTel: kt)
        }
        
    }
    // MARK: - Functions
    
    // Bu kendi içerisinde kullanabileceğimiz bir fonksiyon haline getirmiş olacağız.
    func kaydet(kisiAd: String, kisiTel: String) {
        print("Kişi Kaydet: \(kisiAd) - \(kisiTel)")
    }

}
