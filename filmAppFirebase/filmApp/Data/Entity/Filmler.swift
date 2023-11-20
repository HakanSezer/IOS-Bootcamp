//
//  Filmler.swift
//  filmApp
//
//  Created by Hakan Sezer on 24.10.2023.
//

import Foundation

class Filmler {
    var id: String?
    var ad: String?
    var resim: String?
    var fiyat: Int?
    
    init(id: String, ad: String, resim: String, fiyat: Int) {
        self.id = id
        self.ad = ad
        self.resim = resim
        self.fiyat = fiyat
    }
    
    init() {
        
    }
}
