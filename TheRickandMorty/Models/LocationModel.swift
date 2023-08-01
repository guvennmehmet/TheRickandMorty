//
//  LocationModel.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 1.08.2023.
//

import Foundation

struct LocationModel: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "type"
        case dimension = "dimension"
        case residents = "residents"
    }
}
