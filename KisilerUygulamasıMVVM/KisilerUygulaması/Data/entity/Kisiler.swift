//
//  Kisiler.swift
//  KisilerUygulaması
//
//  Created by Hakan Sezer on 22.10.2023.
//

import Foundation

class Kisiler {
    var kisiID: Int?
    var kisiAd: String?
    var kisiTel: String?

    // Boş init tanımlamış olduk.
    init() {
        
    }
    // Dolu init tanımlamış olduk.
    init(kisiID: Int, kisiAd: String, kisiTel: String) {
        self.kisiID = kisiID
        self.kisiAd = kisiAd
        self.kisiTel = kisiTel
    }
    
    // Bu init tanımalamaları class oluşturduğumuz zaman zorunlu olarak sorsun ya da sormasın mantığıyla yaklaşmış oluyoruz.
}
