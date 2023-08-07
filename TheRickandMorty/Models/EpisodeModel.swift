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
    let characterURLs: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episodeNumber = "episode"
        case url
        case created
        case characterURLs = "characters"
    }
    var formattedCreatedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        if let date = formatter.date(from: created) {
            formatter.dateFormat = "dd-MM-yyyy"
            return formatter.string(from: date)
        }

        return created
    }
}

struct EpisodesList: Codable {
    let results: [Episode]
}
