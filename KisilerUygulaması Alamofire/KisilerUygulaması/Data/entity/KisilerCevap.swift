//
//  KisilerCevap.swift
//  KisilerUygulaması
//
//  Created by Hakan Sezer on 10.11.2023.
//

import Foundation

// Codable'larda hepsinde ? işareti olacak.
class KisilerCevap : Codable {
    var kisiler: [Kisiler]?
    var success: Int?
}
