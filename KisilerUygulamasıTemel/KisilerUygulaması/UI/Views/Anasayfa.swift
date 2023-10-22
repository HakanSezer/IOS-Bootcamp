//
//  ViewController.swift
//  KisilerUygulaması
//
//  Created by Hakan Sezer on 22.10.2023.
//

import UIKit

class Anasayfa: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var kisilerListesi = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        let k1 = Kisiler(kisiID: 1, kisiAd: "Ahmet", kisiTel: "0541231256")
        let k2 = Kisiler(kisiID: 2, kisiAd: "Beyza", kisiTel: "05134647256")
        let k3 = Kisiler(kisiID: 3, kisiAd: "Zeynep", kisiTel: "464356437")
        kisilerListesi.append(k1)
        kisilerListesi.append(k2)
        kisilerListesi.append(k3)
    }
    // Geri döndüğümüzü görebilmek için kullanıyoruz.
    override func viewWillAppear(_ animated: Bool) {
        print("Anasayfaya Dönüldü.")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let kisi = sender as? Kisiler {
                var gidilecekVC = segue.destination as! KisiDetay
                    gidilecekVC.kisi = kisi
            }
        }
    }
    
    
    
}
//MARK: - Extension
extension Anasayfa: UISearchBarDelegate {
    // Search Bar arama sırasında kullanılan Func.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Kişi Ara : \(searchText)")
    }
    
}

extension Anasayfa: UITableViewDelegate, UITableViewDataSource {
    // Kisiler listesi içerisindeki kadar lazım.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListesi[indexPath.row]
        
        // TableViewCell ile bağlantı kurmuş olduk.
        let cell = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! KisilerHucre
        
        cell.labelKisiAd.text = kisi.kisiAd
        cell.labelKisiTel.text = kisi.kisiTel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListesi[indexPath.row]
        
        performSegue(withIdentifier: "toDetay", sender: kisi)
        // seçilmeyi kaldırmak için kullanıyoruz.
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contextAction, view, bool in
            let kisi = self.kisilerListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisiAd) Silinsin mi?", preferredStyle: .alert)
            
            let  iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                print("Seçildi: \(kisi.kisiAd!)")
            }
            alert.addAction(evetAction)
            
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
}
