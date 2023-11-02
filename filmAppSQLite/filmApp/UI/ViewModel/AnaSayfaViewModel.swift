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
        // Bunu yapmazsak veri tabanını kopyalamaz böylelikle çalışmaz.
        veritabaniKopyala()
        // Filmler listesinin tetiklenerek FilmlerDaoRepository tetiklemeyi sağlayacak.
        filmlerListesi = frepo.filmlerListesi
        // Bununla yüklenecek yoksa yüklenmez.
        filmleriYukle()
    }
    
    func filmleriYukle() {
        frepo.filmleriYukle()
    }
    
    func veritabaniKopyala(){
            //Buradan alıyoruz. ilk bununla SQL oluşturuyoruz.
            let bundleYolu = Bundle.main.path(forResource: "filmler_app", ofType: ".sqlite")
            // Bizim Hedefte nereye kopyalacağımızı seçtiğimiz yer.
            // Genel yola erişiyoruz. Hedef yol ile sonra
            let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            // Sonra kopyalama yapılacak yere erişiyoruz. hedef yoluyl yapıyoruz bunu
            let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler_app.sqlite")
            //DataCore bölümünde kullanmış olduğumuz FileManager kullanıyoruz.
            let fileManager = FileManager.default
            // Bunula kontrol ediyoruz. Bu var mı yok mu diye. DOSYA VAR MI?
            if fileManager.fileExists(atPath: kopyalanacakYer.path){
                print("Veritabanı zaten var")
            }else{
                do{
                    // Böylelikle kopyalamayı yapıyoruz.
                    try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                }catch{}
            }
    }
    
}
