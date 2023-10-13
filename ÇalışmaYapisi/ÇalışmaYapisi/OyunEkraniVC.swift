//
//  OyunEkraniVC.swift
//  ÇalışmaYapisi
//
//  Created by Hakan Sezer on 13.10.2023.
//

import UIKit

class OyunEkraniVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func geriButton(_ sender: Any) {
        navigationController?.popViewController(animated: true) // Bir önceki sayfaya dönüş için kullanılıyor.
        navigationController?.popToRootViewController(animated: true) // Anasayfaya Dönüş için kullanılmaktadır.
    }
    @IBAction func bittiButton(_ sender: Any) {
        performSegue(withIdentifier: "sonucEkraninaGecis", sender: nil)
    }
    
}
