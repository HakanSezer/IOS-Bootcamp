//
//  KisilerDaoRepository.swift
//  KisilerUygulaması
//
//  Created by Hakan Sezer on 30.10.2023.
//

import Foundation
import RxSwift
import Alamofire

class KisilerDaoRepository {
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    // Kisiler Kayit İşlemi üzerinden oluyor. KisiKayitView
    func kaydet(kisiAd: String, kisiTel: String) {
        let params:Parameters = ["kisi_ad":kisiAd,"kisi_tel":kisiTel]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php",method: .post,parameters: params ).response { response in
            if let data = response.data {
                do {
                    // datayı alıyoruz. sonrasında From kısmına aktarıyoruz. ve KisilerCevap bölümüne aktarmış oluyoruz.
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    
                    print("Başarı: \(cevap.success!)")
                    print("Başarı: \(cevap.message!)")
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    //KisiDetayViewModel
    func guncelle(kisiID: Int,kisiAd: String, kisiTel: String) {
        let params:Parameters = ["kisi_id":kisiID,"kisi_ad":kisiAd,"kisi_tel":kisiTel]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php",method: .post,parameters: params ).response { response in
            if let data = response.data {
                do {
                    // datayı alıyoruz. sonrasında From kısmına aktarıyoruz. ve KisilerCevap bölümüne aktarmış oluyoruz.
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    
                    print("Başarı: \(cevap.success!)")
                    print("Başarı: \(cevap.message!)")
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    //AnasayfaView
    func sil(kisiID: Int) {
        
        let params:Parameters = ["kisi_id":kisiID]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php",method: .post,parameters: params ).response { response in
            if let data = response.data {
                do {
                    // datayı alıyoruz. sonrasında From kısmına aktarıyoruz. ve KisilerCevap bölümüne aktarmış oluyoruz.
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Başarı: \(cevap.success!)")
                    print("Başarı: \(cevap.message!)")
                    // bu son verileri görmemizi sağlayacaklardan.
                        self.kisilerYukle()
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    //AnaSayfaView
    func ara(aramaKelimesi: String) {
        let params:Parameters = ["kisi_ad":aramaKelimesi]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php",method: .post,parameters: params ).response { response in
            if let data = response.data {
                do {
                    // datayı alıyoruz. sonrasında From kısmına aktarıyoruz. ve KisilerCevap bölümüne aktarmış oluyoruz.
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let liste = cevap.kisiler {
                        // bunu gösterebilmek için asyc olması lazım
                        self.kisilerListesi.onNext(liste) // Tetikleme.
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func kisilerYukle() {
        // Bunla berabar dataya erişmiş oluyoruz.
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php",method: .get ).response { response in
            if let data = response.data {
                do {
                    // datayı alıyoruz. sonrasında From kısmına aktarıyoruz. ve KisilerCevap bölümüne aktarmış oluyoruz.
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let liste = cevap.kisiler {
                        // bunu gösterebilmek için asyc olması lazım
                        self.kisilerListesi.onNext(liste) // Tetikleme.
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
