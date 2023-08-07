//
//  CharacterModel.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 24.07.2023.
//

import Foundation

// Rick and Morty API info
/*
 
 URL:
https://rickandmortyapi.com/api
 
 */

struct Character: Codable, Identifiable, DateFormattable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: CharacterLocationModel
    let location: CharacterLocationModel
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case type
        case gender
        case origin
        case location
        case image
        case episode
        case url
        case created
    }
}

struct CharacterLocationModel: Codable {
    let name: String
    let url: String
}

struct CharactersList: Codable {
    let results: [Character]
}
