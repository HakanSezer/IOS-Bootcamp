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
        // Anasayfa ilk çalıştığı anda kullanılacaktır.
        veritabaniKopyala()
        // Bunu sebebi KisilerDaoRepository ile bağlantı sağlamasıdır.
        kisilerListesi = krepo.kisilerListesi
        // KisilerDaoRepository içerisindeki verileri getirmeyi sağlayacak. Bu olmazsa değer olmaz.
        kisileriYukle()
        
        
    }
    
    func sil(kisiID: Int) {
        krepo.sil(kisiID: kisiID)
    }
    
    func ara(aramaKelimesi: String) {
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func kisileriYukle() {
        krepo.kisilerYukle()
    }
    
    // Veritabanı Kopyalama Kodlaması
    func veritabaniKopyala(){
        // Bunun sayesinde bu koda erişiyoruz.
            let bundleYolu = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")
        // Veri telefonu içerisinde kayıt yeri seçiliyor. Uygulama içerisinde dosya yolu
            let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        // hedef yolla kopyalanacak yer oluşuyor. Kopyalacak yeri oluşturuyoruz.
            let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
            let fileManager = FileManager.default
        // Kopyalacağımız zaman daha önce kıpalanıp kopyalanmadığını kontrol ediyoruz.
            if fileManager.fileExists(atPath: kopyalanacakYer.path){
                print("Veritabanı zaten var")
            }else{
                do{
                    try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                }catch{
            }
        }
    }
}
