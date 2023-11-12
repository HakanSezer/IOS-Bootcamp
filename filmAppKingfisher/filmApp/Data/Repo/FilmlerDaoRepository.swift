//
//  FilmlerDaoRepository.swift
//  filmApp
//
//  Created by Hakan Sezer on 31.10.2023.
//

import Foundation
import RxSwift
import Alamofire

class FilmlerDaoRepository {
 
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
    
    func filmleriYukle() {
        AF.request("http://kasimadalan.pe.hu/filmler_yeni/tum_filmler.php", method: .get).response { response in
            // Bu bizim internet sitesi üzerinden çekmiş olduğumuz oalcaktır.
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(FilmlerCevap.self, from: data)
                    if let liste = cevap.filmler {
                        // geri dönüş tetiklenmesi yaratır. Bununla AnaSayfaViewModel'daki init içindeki filmlerListesini tetikler
                        self.filmlerListesi.onNext(liste)

                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
            
        }
        
        
            }
}
