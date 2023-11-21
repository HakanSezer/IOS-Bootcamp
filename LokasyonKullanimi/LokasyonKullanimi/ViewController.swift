//
//  ViewController.swift
//  LokasyonKullanimi
//
//  Created by Hakan Sezer on 21.11.2023.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var labelEnlem: UILabel!
    @IBOutlet weak var labelHız: UILabel!
    @IBOutlet weak var labelBoylam: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bu bizim location üzerindeki ayarlamalarımızı konumuzu görebilmeyi sağlar.
        // fakat dikkat etmek lazım battaryayı yer
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //fakat bunlar için, infodan izin verilmesi lazım.
        //Arayüzü çıkaracak olan
        locationManager.requestWhenInUseAuthorization()
        //Konumu günceller.
        locationManager.startUpdatingLocation()
        //enlem boylam bilgilerini alırız.
        locationManager.delegate = self
        
       
    }
}

// Bu location bilgilerini veriyoruz.
// Bunu için izin vermemiz lazım
extension ViewController: CLLocationManagerDelegate {
    //
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // konulara göre hareket ederek seçiyoruz.
        let sonKonum = locations[locations.count-1]
        
        let enlem = sonKonum.coordinate.latitude
        let boylam = sonKonum.coordinate.longitude
        
        labelEnlem.text = "Enlem: \(enlem)"
        labelBoylam.text = "Boylam \(boylam)"
        labelHız.text = "Hiz \(sonKonum.speed)"
        
        // Harita ile ilgili bölge hazırlayacağız.
        let konum = CLLocationCoordinate2D(latitude: enlem, longitude: boylam)
        //Zoom miktarı
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        // Bölge
        let bolge = MKCoordinateRegion(center: konum, span: span)
        mapView.setRegion(bolge, animated: true)
        
       /* let pin = MKPointAnnotation()
        pin.coordinate = konum
        pin.title = "\(enlem) - \(boylam)"
        pin.subtitle = "Konum"
        mapView.addAnnotation(pin)
        */
        mapView.showsUserLocation = true
    }
}
