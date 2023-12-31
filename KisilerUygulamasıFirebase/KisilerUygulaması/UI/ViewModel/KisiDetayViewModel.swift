//
//  KisiDetayViewModel.swift
//  KisilerUygulaması
//
//  Created by Hakan Sezer on 30.10.2023.
//

import Foundation


class KisiDetayViewModel {
    
    var krepo = KisilerDaoRepository()
    
    func guncelle(kisi_id: String,kisi_ad: String, kisi_tel: String) {
        krepo.guncelle(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
}
