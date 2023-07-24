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

struct CharacterModel: Codable {
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: String
    let location: String
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
}
