//
//  FilmlerHucre.swift
//  filmApp
//
//  Created by Hakan Sezer on 24.10.2023.
//

import UIKit

protocol HucreProtocol {
    func sepeteEkle(indexPath:IndexPath)
}

class FilmlerHucre: UICollectionViewCell {
    @IBOutlet weak var imageViewFilm: UIImageView!
    @IBOutlet weak var labelFiyat: UILabel!
    
    
    
    var hucreProtocol:HucreProtocol?
    var indexPath: IndexPath?
    
    
    
    
    //MARK: - Actions
    @IBAction func sepeteEkle(_ sender: Any) {
        hucreProtocol?.sepeteEkle(indexPath: indexPath!)
    }
}
