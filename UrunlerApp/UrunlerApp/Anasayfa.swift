//
//  ViewController.swift
//  UrunlerApp
//
//  Created by Hakan Sezer on 23.10.2023.
//

import UIKit

class Anasayfa: UIViewController {
    @IBOutlet weak var urunlerTableView: UITableView!
    
    
    var urunlerListesi = [Urunler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Data
        urunlerTableView.dataSource = self
        urunlerTableView.delegate = self
        
        
        // Add Urunler.
        let u1 = Urunler(id: 1, ad: "Macbook Pro 14", resim: "bilgisayar", fiyat: 43000)
        let u2 = Urunler(id: 2, ad: "Rayban Club Master", resim: "gozluk", fiyat: 2500)
        let u3 = Urunler(id: 3, ad: "Sony ZX Series", resim: "kulaklik", fiyat: 40000)
        let u4 = Urunler(id: 4, ad: "Gio Armani", resim: "parfum", fiyat: 2000)
        let u5 = Urunler(id: 5, ad: "Casio X Series", resim: "saat", fiyat: 8000)
        let u6 = Urunler(id: 6, ad: "Dyson V8", resim: "supurge", fiyat: 18000)
        let u7 = Urunler(id: 7, ad: "Iphone 13", resim: "telefon", fiyat: 32000)
        urunlerListesi.append(u1)
        urunlerListesi.append(u2)
        urunlerListesi.append(u3)
        urunlerListesi.append(u4)
        urunlerListesi.append(u5)
        urunlerListesi.append(u6)
        urunlerListesi.append(u7)
        
        
        // Bu ortadaki çizgiyi kaldırmak içi kullanılmaktadır.
        urunlerTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
    }
    
}

extension Anasayfa: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunlerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let urun = urunlerListesi[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre", for: indexPath) as! UrunlerHucre
        cell.imageViewUrun.image = UIImage(named: urun.resim!)
        cell.urunAd.text = urun.ad
        cell.urunFiyat.text = "\(urun.fiyat!)"
        
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        cell.hucreArkaPlan.layer.cornerRadius = 10
        
        return cell
    }
}

