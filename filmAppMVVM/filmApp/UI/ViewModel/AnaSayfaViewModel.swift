//
//  AnaSayfaViewModel.swift
//  filmApp
//
//  Created by Hakan Sezer on 31.10.2023.
//

import Foundation
import RxSwift

class AnaSayfaViewModel {
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
    var frepo = FilmlerDaoRepository()
    
    // Anasayfa'da oluşturulduğu için çalışır.
    init() {
        // Filmler listesinin tetiklenerek FilmlerDaoRepository tetiklemeyi sağlayacak.
        filmlerListesi = frepo.filmlerListesi
        // Bununla yüklenecek yoksa yüklenmez.
        filmleriYukle()
    }
    
    func filmleriYukle() {
        frepo.filmleriYukle()
    }
    
}
