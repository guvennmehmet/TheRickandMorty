//
//  CharacterViewModel.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 31.07.2023.
//

import SwiftUI

import SwiftUI

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []

    func fetchCharacters() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(CharacterResponse.self, from: data)
                DispatchQueue.main.async {
                    self.characters = response.results
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
    
    func getCharacterById(_ id: Int) -> Character? {
            return characters.first { $0.id == id }
        }
}

struct CharacterResponse: Codable {
    let results: [Character]
}
