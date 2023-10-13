//
//  OyunEkraniVC.swift
//  ÇalışmaYapisi
//
//  Created by Hakan Sezer on 13.10.2023.
//

import UIKit

class OyunEkraniVC: UIViewController {
    
    var kisiler: Kisiler?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = kisiler {
            print("Kisi ad: \(k.ad!)")
            print("Kisi yas: \(k.yas!)")
            print("Kisi boy: \(k.boy!)")
            print("Kisi bekar: \(k.bekar!)")
            
        }
        
    }
    @IBAction func geriButton(_ sender: Any) {
        //navigationController?.popViewController(animated: true) // Bir önceki sayfaya dönüş için kullanılıyor.
        navigationController?.popToRootViewController(animated: true) // Anasayfaya Dönüş için kullanılmaktadır.
    }
    @IBAction func bittiButton(_ sender: Any) {
        performSegue(withIdentifier: "sonucEkraninaGecis", sender: nil)
    }
    
}
