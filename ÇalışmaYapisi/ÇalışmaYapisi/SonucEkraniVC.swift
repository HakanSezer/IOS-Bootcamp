//
//  SonucEkraniVC.swift
//  ÇalışmaYapisi
//
//  Created by Hakan Sezer on 13.10.2023.
//

import UIKit

class SonucEkraniVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func kapatButton(_ sender: Any) {
        self.dismiss(animated: true) // direk perform Modely olduğu için sayfayı kapatmaktadır.
    }
}
