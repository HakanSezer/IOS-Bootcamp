//
//  ViewController.swift
//  TasarimCalismasi
//
//  Created by Hakan Sezer on 12.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Yaşam Döngüsü Yapısı
        self.navigationItem.title = "Pizza"
        
        // Renkler için yapılmakta olan
        let appearance = UINavigationBarAppearance()
        // Arkada plan rengini değiştirme için kullanılıyor.
        appearance.backgroundColor = UIColor(named: "anaRenk")
        // NavigationControler yazı rengini değiştirme için kullanılır.
        // Font oluşturduk. İnfo.plist tanımlamak gereklidir.
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "yaziRenk1")!, .font: UIFont(name: "Pacifico-Regular", size: 22)!]
        // Bununla birlikte kod içirisindeki saatlerin ve Wifi görüntülerin rengini Beyaz çevirmeyi sağladık.
        // Sadece iki renk bulunmaktadır. 1. Black olursa Beyaz White olursa Siyah oluyor.
        navigationController?.navigationBar.barStyle = .black
        
        // Arka Plan rengine erişme için kullanıla güncel kod bloğu.
        // Apple'ın kendi kaynaklarında daha bilgisi bulunmamaktadır.
        // Bu kodlar yeni iphone telefonları etkilediği için kullanmış oluyoruz.
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }


}

