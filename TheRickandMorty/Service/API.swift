//
//  API.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 31.07.2023.
//

import Foundation

enum API {
    static let baseURL = "https://rickandmortyapi.com/api/character"
    
    static var characterURL: URL {
        guard let url = URL(string: baseURL) else {
            fatalError("Invalid URL: \(baseURL)")
        }
        return url
    }
}
