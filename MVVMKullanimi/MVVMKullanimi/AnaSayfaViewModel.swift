//
//  AnaSayfaViewModel.swift
//  MVVMKullanimi
//
//  Created by Hakan Sezer on 30.10.2023.
//

import Foundation
import RxSwift

class AnaSayfaViewModel {
    var sonuc = BehaviorSubject<String>(value: "0")
    var mrepo = MatematikRepository()
    
    init() {
        //Matematik Reposuna eşitleyecek.
        sonuc = mrepo.sonuc
    }
    
    
    
    func toplamaYap(alinanSayi1: String, alinanSayi2: String) {
        mrepo.toplamaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    }
    
    func carpmaYap(alinanSayi1: String, alinanSayi2: String) {
        mrepo.carpmaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    }
    
}
