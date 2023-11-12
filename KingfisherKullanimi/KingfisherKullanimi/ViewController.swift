//
//  ViewController.swift
//  KingfisherKullanimi
//
//  Created by Hakan Sezer on 12.11.2023.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // http://kasimadalan.pe.hu/yemekler/resimler/kofte.png
        resimGoster(resimAdi: "kofte.png")
    }
    @IBAction func button1(_ sender: Any) {
        resimGoster(resimAdi: "ayran.png")
    }
    @IBAction func button2(_ sender: Any) {
        resimGoster(resimAdi: "su.png")
    }
    
    
    // Bunula beraber bir fonksiyon ile başlatmış oluyoruz.
    func resimGoster(resimAdi: String) {
        // Bu sayde urlsden çekmiş oluyoruz. Bunu kingfisher yapıyor.
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)") {
            DispatchQueue.main.async {
                self.imageView.kf.setImage(with: url)
            }
        }
    }
}

