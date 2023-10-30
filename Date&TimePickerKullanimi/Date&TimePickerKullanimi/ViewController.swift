//
//  ViewController.swift
//  Date&TimePickerKullanimi
//
//  Created by Hakan Sezer on 30.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfSaat: UITextField!
    @IBOutlet weak var tfTarih: UITextField!
    
    var datePicker: UIDatePicker?
    var timePicker: UIDatePicker?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Tarih için kullanılan kodlar.
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        tfTarih.inputView = datePicker
        
        // Saat
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        tfSaat.inputView = timePicker
        
        
        // geçmiş version iOS
        if #available(iOS 13.4, *) {
            datePicker?.preferredDatePickerStyle = .wheels
            timePicker?.preferredDatePickerStyle = .wheels
        }
        
        
        //dokunmayı bildimek için kullanıyoruz.
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(dokunmaAlgılama))
        view.addGestureRecognizer(dokunmaAlgilama)
        
        // Tetikleme
        // ValueChange -> değer değişikliği oldu her anda değer getirmesini sağlıyoruz.
        datePicker?.addTarget(self, action: #selector(tarihGoster(uiDatePicker:)), for: .valueChanged)
        timePicker?.addTarget(self, action: #selector(saatGoster(uiDatePicker:)), for: .valueChanged)
    }

    @objc func dokunmaAlgılama() {
        print("Ekrana dokundun.")
        // Ekranda bulunanları sıfırlama
        view.endEditing(true)
    }
    
    @objc func tarihGoster(uiDatePicker: UIDatePicker) {
        let format = DateFormatter()
        format.dateFormat = "MM/dd/yyyy"
        let alinanTarih = format.string(from: uiDatePicker.date)
        tfTarih.text = alinanTarih
    }
    
    @objc func saatGoster(uiDatePicker: UIDatePicker) {
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let alinanSaat = format.string(from: uiDatePicker.date)
        tfSaat.text = alinanSaat
    }

}

