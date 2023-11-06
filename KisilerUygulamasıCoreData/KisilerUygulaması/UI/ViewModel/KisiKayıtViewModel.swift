//
//  KisiKayıtViewModel.swift
//  KisilerUygulaması
//
//  Created by Hakan Sezer on 30.10.2023.
//

import Foundation


class KisiKayıtViewModel {
    
    var krepo = KisilerDaoRepository()
    
    // krepo.kaydet ile onu KisiKayi üzerinden almış olduğumuz değerleri KisilerDaoRepository aktarmış olacaktır.
    func kaydet(kisiAd: String, kisiTel: String) {
        krepo.kaydet(kisi_ad: kisiAd, kisi_tel: kisiTel)
    }
}
