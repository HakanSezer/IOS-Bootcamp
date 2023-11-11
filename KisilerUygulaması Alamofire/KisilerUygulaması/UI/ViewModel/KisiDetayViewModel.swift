//
//  KisiDetayViewModel.swift
//  KisilerUygulaması
//
//  Created by Hakan Sezer on 30.10.2023.
//

import Foundation


class KisiDetayViewModel {
    
    var krepo = KisilerDaoRepository()
    
    func guncelle(kisiID: Int,kisiAd: String, kisiTel: String) {
        krepo.guncelle(kisiID: kisiID, kisiAd: kisiAd, kisiTel: kisiTel)
    }
}
