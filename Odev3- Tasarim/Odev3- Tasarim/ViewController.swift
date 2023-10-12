//
//  ViewController.swift
//  Odev3- Tasarim
//
//  Created by Hakan Sezer on 12.10.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Coffee"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "Color")
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "yaziText1")!, .font: UIFont(name: "AutourOne-Regular", size: 22)!]
        
        navigationController?.navigationBar.barStyle = .default
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }


}

