//
//  ViewController.swift
//  MVVMKullanimi
//
//  Created by Hakan Sezer on 30.10.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var textFieldSayi2: UITextField!
    @IBOutlet weak var textFieldSayi1: UITextField!
    
    // Uygulama ilk çalıştığı anda 
    var viewModel = AnaSayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = viewModel.sonuc.subscribe(onNext: { s in // Dinleme.
            self.labelSonuc.text = s
        })
    }
    @IBAction func buttonToplama(_ sender: Any) {
        if let alinanSayi1 = textFieldSayi1.text, let alinanSayi2 = textFieldSayi2.text {
            viewModel.toplamaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
        }
    }
    @IBAction func carpmaButton(_ sender: Any) {
        if let alinanSayi1 = textFieldSayi1.text, let alinanSayi2 = textFieldSayi2.text {
            viewModel.carpmaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
        }
    }
    

}

