//
//  ViewController.swift
//  WidgetsKullanimi
//
//  Created by Hakan Sezer on 18.10.2023.
//

import UIKit

class ViewController: UIViewController {
    // Slider
    @IBOutlet weak var labelSlider: UILabel!
    @IBOutlet weak var slider: UISlider!
    //Resim için seçimler.
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sonucLabel: UILabel!
    // Yemek Tatlı İçecek Seçimi.
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var mSwitch: UISwitch!
    @IBOutlet weak var textFieldGirdi: UITextField!
    // Stepper Seçim.
    @IBOutlet weak var stapperLabel: UILabel!
    @IBOutlet weak var stapper: UIStepper!
    // Activity Indicator
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // İlk açıldığını Label içerisinde yazılacak olan sayıyı gösterecektir.
        labelSlider.text = String(Int(slider.value))
        stapperLabel.text = String(stapper.value)
        indicator.isHidden = true
        
    }
    @IBAction func buttonBasla(_ sender: Any) {
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    @IBAction func buttonDur(_ sender: Any) {
        indicator.isHidden = true
        indicator.stopAnimating()
    }
    
    @IBAction func buttonYap(_ sender: Any) {
        if let alinanVeri = textFieldGirdi.text {
            sonucLabel.text = alinanVeri
        }
    }
    @IBAction func buttonMutlu(_ sender: Any) {
        imageView.image  = UIImage(named: "resim1")
    }
    @IBAction func buttonUzgun(_ sender: Any) {
        imageView.image = UIImage(named: "resim2")
    }
    @IBAction func buttonGoster(_ sender: Any) {
        // Segmented Control için geçerli kodttur.
        let secilenIndex = segmentedControl.selectedSegmentIndex // index'ini almış oluyoruz.
        let secilenKategori = segmentedControl.titleForSegment(at: secilenIndex) // bu index ile birlikte bunu adını almış oluyoruz.
        print("Segmented Durum : \(secilenKategori!)")
        // Slider içerisinde bulunan değeri görmüş oluyoruz.
        print("Slider Durum : \(slider.value)")
        // Stepper İçerik Gösterme
        print("Stapper : \(stapper.value)")
        
        
        // Switch için geçerli olan kodtur.
        print("Switch Durum: \(mSwitch.isOn)")
    }
    // sender yazarsak böylelikle daha iyi olacak çünkü UISwitch özelliklerini bize vermiş olacak.
    @IBAction func switchDegisim(_ sender: UISwitch) {
        if sender.isOn {
            print("Switch: ON")
        }else {
            print("Switch: OFF")
        }
    }
    @IBAction func segmentedDegisim(_ sender: UISegmentedControl) {
        let secilenIndex = sender.selectedSegmentIndex
        let secilenKategori = sender.titleForSegment(at: secilenIndex)
        print("Secilen : \(secilenKategori!)")
    }
    
    
    @IBAction func sliderDegisim(_ sender: UISlider) {
        // Bu değer ile label içerisine gerek slider kaydırmasında kaç ve nerede durduğunu görmüş oluyoruz. Bunu dışında bu sayıyı double değil de Int olarak böyle tutmuş oluyoruz
        labelSlider.text = String(Int(sender.value))
        
    }
    @IBAction func stapperDegisim(_ sender: UIStepper) {
        stapperLabel.text = String(sender.value)
    }
    
}

