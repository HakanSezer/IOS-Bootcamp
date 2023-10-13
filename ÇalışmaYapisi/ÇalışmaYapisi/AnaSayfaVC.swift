//
//  ViewController.swift
//  ÇalışmaYapisi
//
//  Created by Hakan Sezer on 13.10.2023.
//

import UIKit

class AnaSayfaVC: UIViewController {
    @IBOutlet weak var anaSayfaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func yapButton(_ sender: Any) {
    }
    
    @IBAction func baslaButton(_ sender: Any) {
        performSegue(withIdentifier: "oyunEkraninaGecis", sender: nil)
    }
}

