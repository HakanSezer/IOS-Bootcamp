//
//  ViewController.swift
//  filmApp
//
//  Created by Hakan Sezer on 24.10.2023.
//

import UIKit
import Kingfisher

class AnaSayfa: UIViewController {
    @IBOutlet weak var filmlerCollectionView: UICollectionView!
    
    
    var filmlerListesi = [Filmler]()
    // Bu çalıştığı zaman AnaSayfaViewModel kullanımı çalıştı. Bu'da AnaSayfaViewModel içerisinde yer alan init metodu çalıştı.
    var viewModel = AnaSayfaViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmlerCollectionView.dataSource = self
        filmlerCollectionView.delegate = self
        
        // FilmlerDaoRepository tetiklenmesiyle oluşmaktatır.
        _ = viewModel.filmlerListesi.subscribe(onNext: { liste in
            // Liste güncellemek için kullanılmaktadır.
            self.filmlerListesi = liste
            // Verilerin daha hızlı çalışmasını sağlar bu yapı uygulamanın kasmamasını sağlar.
            DispatchQueue.main.async {
                self.filmlerCollectionView.reloadData()
            }
        })
        
        
        // Hessaplamalar.
        let tasarim = UICollectionViewFlowLayout()
        // Sağ Sol ve aşağı yukarı
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        // Dikey Aralık
        tasarim.minimumInteritemSpacing = 10
        // Yatay Aralık
        tasarim.minimumLineSpacing = 10
        
        // 10 X 10 X 10
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 30) / 2
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.6)
        
        filmlerCollectionView.collectionViewLayout = tasarim
        
        
    }
}

extension AnaSayfa: UICollectionViewDelegate, UICollectionViewDataSource, HucreProtocol {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = filmlerListesi[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmlerHucre", for: indexPath) as! FilmlerHucre
        
        
        // İnternetten URL olarak resim dosyasını çekmemizi sağlıyoru.
        if let url = URL(string: "http://kasimadalan.pe.hu/filmler_yeni/resimler/\(film.resim!)") {
            DispatchQueue.main.async {
                cell.imageViewFilm.kf.setImage(with: url)
            }
        }
        
        cell.labelFiyat.text = "\(film.fiyat!) ₺"
        
        //Arka plan tasarım.
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        
        //protcolleri
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        
        performSegue(withIdentifier: "toDetay", sender: film)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let film = sender as? Filmler {
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.film = film
            }
        }
    }
    func sepeteEkle(indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        print("\(film.ad!) Sepete Eklendi.")
    }
}
