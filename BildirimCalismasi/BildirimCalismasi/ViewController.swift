//
//  ViewController.swift
//  BildirimCalismasi
//
//  Created by Hakan Sezer on 20.11.2023.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var izinKontrol = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Extension çalışmasını sağlamış olduk.
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {
            // Bunu kendimiz belirliyoruz. Ve Granted alert için öteki de error için.
            granted, error in
            self.izinKontrol = granted
            
            if granted {
                print("İzin alma işlemi başarılı")
            }else {
                print("İzin alma işlemi başarısız.")
            }
        })
    }
    
    // Bildirim için uyarıları açmamız lazım
    // Bildirimler için izin almamzı lazım.
    @IBAction func buttonBildirimOlustur(_ sender: Any) {
        
        if izinKontrol {
            let icerik = UNMutableNotificationContent()
            icerik.title = "Başlık"
            icerik.subtitle = "Alt Başlık"
            icerik.body = "Mesaj"
            icerik.badge = 1
            icerik.sound = UNNotificationSound.default
            
            // Tetikleme için. Tekrar göstermemk için False yaptık.
            let  tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            
            // Beğenileri ve yorumları gruplar gibi düşünebilirsiniz.
            let bildirimIstek = UNNotificationRequest(identifier: "id", content: icerik, trigger: tetikleme)
            
            UNUserNotificationCenter.current().add(bildirimIstek)
        }
        
    }
    

}

extension ViewController: UNUserNotificationCenterDelegate {
    // İçeride bildirim almayı sağlıyoruz.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Banner uygulama çık olduğunda kullanmış olduğumız alert sistemidir.
        completionHandler([.banner,.sound,.badge ])
    }
    // Bildirime tıklanılmayı burada sağlıyoruz.
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // Bunla Badge değeri sıfırlanır.
        let app = UIApplication.shared
        app.applicationIconBadgeNumber = 0
        print("Bildirim seçildi.")
        
        if app.applicationState == .active {
            print("Bildirim seçildi.")
        }
        
        if app.applicationState == .inactive {
            print("Arkaplan: Bildirim Seçildi.")
        }
        
        completionHandler()
    }
}

