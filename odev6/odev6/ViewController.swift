//
//  ViewController.swift
//  odev6
//
//  Created by Hakan Sezer on 1.11.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var muziklerCollectionView: UICollectionView!
    
    var muziklerListesi = [Muzikler]()
    override func viewDidLoad() {
        super.viewDidLoad()
        muziklerCollectionView.delegate = self
        muziklerCollectionView.dataSource = self
        
        let m1 = Muzikler(id: 1, resim: "Resim1")
        let m2 = Muzikler(id: 2, resim: "Resim2")
        let m3 = Muzikler(id: 3, resim: "Resim3")
        let m4 = Muzikler(id: 4, resim: "Resim4")
        let m5 = Muzikler(id: 5, resim: "Resim5")
        let m6 = Muzikler(id: 6, resim: "Resim6")
        let m7 = Muzikler(id: 7, resim: "Resim7")
        let m8 = Muzikler(id: 8, resim: "Resim8")
        muziklerListesi.append(m1)
        muziklerListesi.append(m2)
        muziklerListesi.append(m3)
        muziklerListesi.append(m4)
        muziklerListesi.append(m5)
        muziklerListesi.append(m6)
        muziklerListesi.append(m7)
        muziklerListesi.append(m8)
        
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        tasarim.minimumInteritemSpacing = 12
        tasarim.minimumLineSpacing = 12
        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 34) / 2.1
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 0.7)
        
        muziklerCollectionView.collectionViewLayout = tasarim
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return muziklerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let muzik = muziklerListesi[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "muziklerHucre", for: indexPath) as! MuzikCollectionViewCell
        cell.imageView.image = UIImage(named: muzik.resim!)
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        
        return cell
    }
}
