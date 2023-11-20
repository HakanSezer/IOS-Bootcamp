//
//  KisilerDaoRepository.swift
//  KisilerUygulaması
//
//  Created by Hakan Sezer on 30.10.2023.
//

import Foundation
import RxSwift
import FirebaseFirestore

class KisilerDaoRepository {
    
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    // Bunun sayesinde Firestore üzerinde class kurmuş oluyoruz.
    var collectionKisiler = Firestore.firestore().collection("Kisiler")
    
    // Kisiler Kayit İşlemi üzerinden oluyor. KisiKayitView
    func kaydet(kisi_ad: String, kisi_tel: String) {
        // Any bütün türleri kapsıyor.
        let yeniKisi: [String:Any] = ["kisi_id":"" , "kisi_ad":kisi_ad, "kisi_tel":kisi_tel]
        collectionKisiler.document().setData(yeniKisi)
    }
    
    //KisiDetayViewModel
    func guncelle(kisi_id: String,kisi_ad: String, kisi_tel: String) {
        let guncellenenKisi: [String:Any] = ["kisi_ad":kisi_ad, "kisi_tel":kisi_tel]
        collectionKisiler.document(kisi_ad).updateData(guncellenenKisi)
    }
    //AnasayfaView
    func sil(kisi_id: String) {
        collectionKisiler.document(kisi_id).delete()
    }
    
    //AnaSayfaView
    func ara(aramaKelimesi: String) {
        // Firebase üzerinden çalışmasını sağlıyor.
        collectionKisiler.addSnapshotListener { snapshot,error in
            var liste = [Kisiler]()
            if let documents = snapshot?.documents {
                for document in documents {
                    //Firebase üzerindeki datalara erişmeyi sağlıyor.
                    let data = document.data()
                    let kisi_id = document.documentID
                    // bunla beraber nesneleri çekiyoruz ve çektiğimiz nesnelerde sorun olursa boş dönecek.
                    let kisi_ad = data["kisi_ad"] as? String ?? ""
                    let kisi_tel = data["kisi_tel"] as? String ?? ""
                    
                    if kisi_ad.lowercased().contains(aramaKelimesi.lowercased()) {
                        let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                        liste.append(kisi)
                        
                    }
                }
            }
            self.kisilerListesi.onNext(liste) // Tetikleme.
        }
    }
    
    func kisilerYukle() {
        // Firebase üzerinden çalışmasını sağlıyor.
        collectionKisiler.addSnapshotListener { snapshot,error in
            var liste = [Kisiler]()
            if let documents = snapshot?.documents {
                for document in documents {
                    //Firebase üzerindeki datalara erişmeyi sağlıyor.
                    let data = document.data()
                    let kisi_id = document.documentID
                    // bunla beraber nesneleri çekiyoruz ve çektiğimiz nesnelerde sorun olursa boş dönecek.
                    let kisi_ad = data["kisi_ad"] as? String ?? ""
                    let kisi_tel = data["kisi_tel"] as? String ?? ""
                    
                    let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                    liste.append(kisi)
                    
                }
            }
            self.kisilerListesi.onNext(liste) // Tetikleme.
        }
    }
}
