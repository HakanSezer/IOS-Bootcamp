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
    func kaydet(kisi_ad: String, kisi_tel: String) {
        krepo.kaydet(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
}
