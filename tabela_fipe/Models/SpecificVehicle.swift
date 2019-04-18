//
//  SpecificVehicle.swift
//  tabela_fipe
//
//  Created by Felipe Moura Soares on 17/04/19.
//  Copyright © 2019 Felipe Moura Soares. All rights reserved.
//

import Foundation


struct SpecificVehicleList: Codable {
    
    var fipeMarca: String?
    var fipeCodigo: String?
    var name: String?
    var marca: String?
    var key: String?
    var veiculo:String?
    var id: String?
    
    enum CodingKeys: String, CodingKey {
        case fipeMarca = "fipe_marca"
        case fipeCodigo = "fipe_codigo"
        case name
        case marca
        case key
        case veiculo
        case id
    }
}
