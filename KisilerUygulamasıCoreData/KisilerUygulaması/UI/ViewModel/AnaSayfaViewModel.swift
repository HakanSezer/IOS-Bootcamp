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
    var kisilerListesi = BehaviorSubject<[KisilerModel]>(value: [KisilerModel]())
    
    // klastan nesne oluşturduğumuz zaman bununla çalışıyor.
    init() {
        // Bunu sebebi KisilerDaoRepository ile bağlantı sağlamasıdır.
        kisilerListesi = krepo.kisilerListesi
        // KisilerDaoRepository içerisindeki verileri getirmeyi sağlayacak. Bu olmazsa değer olmaz.
        kisileriYukle()
        
    }
    
    func sil(kisi: KisilerModel) {
        krepo.sil(kisi: kisi)
    }
    
    func ara(aramaKelimesi: String) {
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    // Anasayfa üzerindeki yükleme yapıldıktan sonra buraya geliyoruz. Buradan da KisilerDaoRepository gidiyor.
    func kisileriYukle() {
        krepo.kisilerYukle()
    }
    
}
