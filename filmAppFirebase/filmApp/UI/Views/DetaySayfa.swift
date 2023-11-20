//
//  DetaySayfa.swift
//  filmApp
//
//  Created by Hakan Sezer on 24.10.2023.
//

import UIKit
import Kingfisher

class DetaySayfa: UIViewController {
    @IBOutlet weak var labelFilm: UILabel!
    @IBOutlet weak var imageViewFilm: UIImageView!
    @IBOutlet weak var labelFiyat: UILabel!
    
    var film:Filmler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let f = film {
            labelFilm.text = f.ad
            if let url = URL(string: "http://kasimadalan.pe.hu/filmler_yeni/resim/\(f.resim!)") {
                DispatchQueue.main.async {
                    self.imageViewFilm.kf.setImage(with: url)
                }
            }
            labelFiyat.text = "\(f.fiyat!) ₺"
        }
    }

}
