//
//  LocationModel.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 1.08.2023.
//

import Foundation

struct Location: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id 
        case name
        case type
        case dimension
        case residents
        case url
        case created
    }
}

struct LocationsList: Codable {
    let results: [Location]
}
