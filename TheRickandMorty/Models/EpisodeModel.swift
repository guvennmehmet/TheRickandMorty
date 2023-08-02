//
//  EpisodeModel.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 2.08.2023.
//

import Foundation

struct Episode: Codable, Identifiable {
    let id: Int
    let name: String
    let airDate: String
    let episodeNumber: String
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episodeNumber = "episode"
        case url
        case created
    }
}

struct EpisodesList: Codable {
    let results: [Episode]
}

