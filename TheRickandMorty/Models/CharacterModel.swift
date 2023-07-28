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

struct Character: Codable, Identifiable {
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

struct CharactersList: Codable {
    let results: [Character]
}

extension Character {
    static let all: [Character] = [
        Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "Scientist", gender: "Male", origin: CharacterLocationModel(name: "Earth", url: "https://rickandmortyapi.com/api/location/1"), location: CharacterLocationModel(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1"], url: "https://rickandmortyapi.com/api/character/1", created: "2017-11-04T18:48:46.250Z"),
        Character(id: 2, name: "Morty Smith", status: "Alive", species: "Human", type: "Human", gender: "Male", origin: CharacterLocationModel(name: "Earth", url: "https://rickandmortyapi.com/api/location/1"), location: CharacterLocationModel(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"), image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1"], url: "https://rickandmortyapi.com/api/character/2", created: "2017-11-04T18:50:21.651Z"),
        Character(id: 3, name: "Summer Smith", status: "Alive", species: "Human", type: "Human", gender: "Female", origin: CharacterLocationModel(name: "Earth", url: "https://rickandmortyapi.com/api/location/1"), location: CharacterLocationModel(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"), image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg", episode: ["https://rickandmortyapi.com/api/episode/6"], url: "https://rickandmortyapi.com/api/character/3", created: "2017-11-04T18:50:21.651Z"),
        Character(id: 4, name: "Jerry Smith", status: "Alive", species: "Human", type: "Human", gender: "Male", origin: CharacterLocationModel(name: "Earth", url: "https://rickandmortyapi.com/api/location/1"), location: CharacterLocationModel(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"), image: "https://rickandmortyapi.com/api/character/avatar/4.jpeg", episode: ["https://rickandmortyapi.com/api/episode/6"], url: "https://rickandmortyapi.com/api/character/4", created: "2017-11-04T18:50:21.651Z"),
        Character(id: 5, name: "Beth Smith", status: "Alive", species: "Human", type: "Human", gender: "Female", origin: CharacterLocationModel(name: "Earth", url: "https://rickandmortyapi.com/api/location/1"), location: CharacterLocationModel(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"), image: "https://rickandmortyapi.com/api/character/avatar/5.jpeg", episode: ["https://rickandmortyapi.com/api/episode/6"], url: "https://rickandmortyapi.com/api/character/5", created: "2017-11-04T18:50:21.651Z"),
        
    ]
}
