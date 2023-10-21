//
//  ViewController.swift
//  tabBarKullanimi
//
//  Created by Hakan Sezer on 13.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bu yapı sayesinde tabBarControler üzerinde bulunanları belirliyoruz.
        if let tabItems = tabBarController?.tabBar.items {
            let anasayfaItem = tabItems[0]
            let ayarlarItem = tabItems[1]
            anasayfaItem.badgeValue = "3"
            ayarlarItem.badgeValue = "Yeni"
        }
        
        // Arka plan Renk değiştirme
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.systemIndigo
        
        // Kullanılabilir halen gelmesi için kullanıyoruz. 
        renkDegistirme(itemAppearance: appearance.stackedLayoutAppearance)
        renkDegistirme(itemAppearance: appearance.inlineLayoutAppearance)
        renkDegistirme(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        // tabBarController erişmek için kullanıyoruz.
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
    }
    func renkDegistirme(itemAppearance: UITabBarItemAppearance) {
        // seçili durum
        itemAppearance.selected.iconColor = UIColor.systemOrange
        // seçili olduğunda yazı rengi
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
        //badge rengi
        itemAppearance.selected.badgeBackgroundColor = UIColor.systemMint
        
        //----- Seçili olmayan durumlarda kullanılacak olan --------
        itemAppearance.normal.iconColor = UIColor.white
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        itemAppearance.normal.badgeBackgroundColor = UIColor.lightGray
    }

}

