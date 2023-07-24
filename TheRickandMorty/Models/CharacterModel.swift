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

struct CharacterModel: Codable, Identifiable {
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
        case id = "id"
        case name = "name"
        case status = "status"
        case species = "species"
        case type = "type"
        case gender = "gender"
        case origin = "origin"
        case location = "location"
        case image = "image"
        case episode = "episode"
        case url = "url"
        case created = "created"
    }
}

struct CharacterLocationModel: Codable {
    let name: String
    let url: String
}

struct CharacterList: Codable {
    let results: [CharacterModel]
}
