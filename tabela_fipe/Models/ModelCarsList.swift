//
//  ModelCarsList.swift
//  tabela_fipe
//
//  Created by Felipe Moura Soares on 17/04/19.
//  Copyright © 2019 Felipe Moura Soares. All rights reserved.
//

import Foundation


struct ModelCarsList: Codable {
    var fipeMarca: String?
    var name: String?
    var marca: String?
    var key: String?
    var id: String?
    var fipeName: String?
    
    enum CodingKeys: String, CodingKey {
        
        case fipeMarca = "fipe_marca"
        case name
        case marca
        case key
        case id
        case fipeName = "fipe_name"
    }
}
