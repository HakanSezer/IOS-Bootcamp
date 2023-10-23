//
//  UrunlerHucre.swift
//  UrunlerApp
//
//  Created by Hakan Sezer on 23.10.2023.
//

import UIKit

class UrunlerHucre: UITableViewCell {
    @IBOutlet weak var hucreArkaPlan: UIView!
    @IBOutlet weak var urunFiyat: UILabel!
    @IBOutlet weak var urunAd: UILabel!
    @IBOutlet weak var imageViewUrun: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: - Actions
    @IBAction func urunSepeteEkle(_ sender: Any) {
    }
    
}
