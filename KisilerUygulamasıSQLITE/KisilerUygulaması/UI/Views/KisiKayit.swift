//
//  KisiKayit.swift
//  KisilerUygulaması
//
//  Created by Hakan Sezer on 22.10.2023.
//

import UIKit

class KisiKayit: UIViewController {
    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    //KisiKayitViewModel Class'ına erişiyoruz. Bu erişim ile bizi KisilerDaoRepository üzerine işlem yapmaya götürecektir.
    var viewModel = KisiKayıtViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Actions
    @IBAction func buttonKaydet(_ sender: Any) {
        if let ka = tfKisiAd.text, let kt = tfKisiTel.text {
            viewModel.kaydet(kisiAd: ka, kisiTel: kt)
        }
        
    }
}
