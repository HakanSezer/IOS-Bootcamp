//
//  Kisiler.swift
//  KisilerUygulaması
//
//  Created by Hakan Sezer on 22.10.2023.
//

import Foundation

class Kisiler {
    var kisi_id: String?
    var kisi_ad: String?
    var kisi_tel: String?

    // Boş init tanımlamış olduk.
    init() {
        
    }
    // Dolu init tanımlamış olduk.
    init(kisi_id: String, kisi_ad: String, kisi_tel: String) {
        self.kisi_id = kisi_id
        self.kisi_ad = kisi_ad
        self.kisi_tel = kisi_tel
    }
    
    // Bu init tanımalamaları class oluşturduğumuz zaman zorunlu olarak sorsun ya da sormasın mantığıyla yaklaşmış oluyoruz.
}
