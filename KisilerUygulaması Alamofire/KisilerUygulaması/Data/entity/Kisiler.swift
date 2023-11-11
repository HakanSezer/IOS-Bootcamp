//
//  Kisiler.swift
//  KisilerUygulaması
//
//  Created by Hakan Sezer on 22.10.2023.
//

import Foundation

// Bu bizim İç class'ımız ve sonrasında KisilerCevap diyerek dışı oluştutuyoruz
class Kisiler : Codable {
    var kisi_id: String?
    var kisi_ad: String?
    var kisi_tel: String?

    // Boş init tanımlamış olduk.
    init() {
        
    }
    // Dolu init tanımlamış olduk.
    init(kisiID: String, kisiAd: String, kisiTel: String) {
        self.kisi_id = kisiID
        self.kisi_ad = kisiAd
        self.kisi_tel = kisiTel
    }
    
}
