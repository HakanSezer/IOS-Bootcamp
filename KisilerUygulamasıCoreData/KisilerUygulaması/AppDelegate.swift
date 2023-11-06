//
//  AppDelegate.swift
//  KisilerUygulaması
//
//  Created by Hakan Sezer on 22.10.2023.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    // Bunlar hazır kodlardır. Sadece ilk başta Use Core Data seçersek sorun giderilmiştir. Olacak.
    lazy var persistentContainer: NSPersistentContainer = {
        // Burada bulunan isim çok önemli veri tabanı dosyası ile aynı olmalıdır.
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription,error) in
            if let e = error {
                print("Hata : \((e as NSError).userInfo)")
            }
        })
        return container
    }()
    // Siz veri tabanı üzerindeki değişikliği kayıt etmek istiyorsanız, Bunu burada onaylamış oluyor.
    func saveContext(){
        // Yukarıdaki yere erişiyor.
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do{
                try context.save()
            }catch{
                print("Hata  : \((error as NSError).userInfo)")
            }
        }
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

