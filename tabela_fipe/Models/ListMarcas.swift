//
//  ListMarcas.swift
//  tabela_fipe
//
//  Created by Felipe Moura Soares on 16/04/19.
//  Copyright © 2019 Felipe Moura Soares. All rights reserved.
//

import Foundation

struct MarcasList: Codable {
    let name : String?
    let fipe_name : String?
    let order : Int?
    let key : String?
    let id : Int?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case fipe_name = "fipe_name"
        case order = "order"
        case key = "key"
        case id = "id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        fipe_name = try values.decodeIfPresent(String.self, forKey: .fipe_name)
        order = try values.decodeIfPresent(Int.self, forKey: .order)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
    }

}


class Stantement : Codable {
    let title: String?
    let desc: String?
    let date: String?
    let value: Double?
}

class StantementList: Codable {
    let statementList:[Stantement]?
    let error: Error?
}


class Error: Codable {
    var message: String?
    var code: Int?
    
    enum CodingKeys: String, CodingKey {
        case message
        case code
    }
}

