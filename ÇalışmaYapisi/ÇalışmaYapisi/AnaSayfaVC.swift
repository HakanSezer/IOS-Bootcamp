//
//  ViewController.swift
//  ÇalışmaYapisi
//
//  Created by Hakan Sezer on 13.10.2023.
//

import UIKit

class AnaSayfaVC: UIViewController {
    @IBOutlet weak var anaSayfaLabel: UILabel!
    
    override func viewDidLoad() { // Uygulama ilk açıldığında çalışır. 1. Kere çalışır.
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) { // Sayfa her göründüğü zaman çalışır
        <#code#>
    }
    
    override func viewWillDisappear(_ animated: Bool) { // sayfa görünmek olduğunda çalışır.
        <#code#>
    }
    
    // sayfa geçişlerini dinlemiş olduğumuz alandır.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // burayı kontrollü şekilde kullanmamız gerekmektedır.
        // Eğer identifier doğru ise sayfa geçişi sağlanıp bu alta belirlediğimiz alan çalışmaya başlayacaktır.
        if segue.identifier == "oyunEkraninaGecis" {
            // baslaButtonu içerisinde bulunan sender'dan String yapısını alıp buraya taşımız oluyoruz.
            if let veri = sender as? Kisiler {
                
                // Bu sayede kodu içeriye aktamış oluyoruz. Oyun Ekranına.
                let gidilecekVC = segue.destination as! OyunEkraniVC
                gidilecekVC.kisiler = veri
            }
        }
    }
    @IBAction func buttonSave(_ sender: Any) {
    }
    @IBAction func buttonAdd(_ sender: Any) {
    }
    
    @IBAction func yapButton(_ sender: Any) {
    }
    
    @IBAction func baslaButton(_ sender: Any) {
        let kisiler = Kisiler(ad: "Hakan", yas: 26, boy: 1.75, bekar: true)
        performSegue(withIdentifier: "oyunEkraninaGecis", sender: kisiler)
    }
}

