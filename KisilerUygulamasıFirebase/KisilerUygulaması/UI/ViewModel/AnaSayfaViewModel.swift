//
//  AnaSayfaViewModel.swift
//  KisilerUygulaması
//
//  Created by Hakan Sezer on 30.10.2023.
//

import Foundation
import RxSwift


class AnaSayfaViewModel {
    
    var krepo = KisilerDaoRepository()
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    init() {
        // Bunu sebebi KisilerDaoRepository ile bağlantı sağlamasıdır.
        kisilerListesi = krepo.kisilerListesi
        // KisilerDaoRepository içerisindeki verileri getirmeyi sağlayacak. Bu olmazsa değer olmaz.
        kisileriYukle()
        
    }
    
    func sil(kisi_id: String) {
        krepo.sil(kisi_id: kisi_id)
    }
    
    func ara(aramaKelimesi: String) {
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func kisileriYukle() {
        krepo.kisilerYukle()
    }
    
}
