//
//  CharacterViewModel.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 31.07.2023.
//

import SwiftUI
import Combine

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []

    private var cancellable: AnyCancellable?
    private var currentPage = 1
    private var isLoading = false

    func fetchCharacters() {
        if isLoading { return }

        let url = URL(string: "\(API.characterURL)/?page=\(currentPage)")!

        self.isLoading = true
        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CharacterResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.isLoading = false
                case .failure(let error):
                    print("Error decoding data: \(error)")
                    self.isLoading = false
                }
            }, receiveValue: { response in
                if !response.results.isEmpty {
                    if self.currentPage == 1 {
                        self.characters = response.results
                    } else {
                        self.characters.append(contentsOf: response.results)
                    }
                }
            })
    }
    
    func fetchMoreCharacters() {
        if isLoading { return }
        currentPage += 1
        fetchCharacters()
    }

    func getCharacterById(_ id: Int) -> Character? {
        return characters.first { $0.id == id }
    }
}

struct CharacterResponse: Codable {
    let results: [Character]
    let info: PageInfo
}
