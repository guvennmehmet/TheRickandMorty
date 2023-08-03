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

    func fetchCharacters() {
        let url = URL(string: "\(API.characterURL)/?page=1")!

        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CharacterResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error decoding data: \(error)")
                }
            }, receiveValue: { response in
                self.characters = response.results

                if let nextPage = response.info.next,
                   let nextPageNumber = Int(nextPage.split(separator: "=").last ?? "") {
                    self.fetchRemainingCharacters(page: nextPageNumber)
                } else {
                    print("Tüm karakterler çekildi.")
                    print("Toplam karakter sayısı: \(self.characters.count)")
                }
            })
    }

    private func fetchRemainingCharacters(page: Int) {
        let url = URL(string: "\(API.baseURL)/character/?page=\(page)")!

        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CharacterResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error decoding data: \(error)")
                }
            }, receiveValue: { response in
                self.characters.append(contentsOf: response.results)

                if let nextPage = response.info.next,
                   let nextPageNumber = Int(nextPage.split(separator: "=").last ?? "") {
                    self.fetchRemainingCharacters(page: nextPageNumber)
                } else {
                    print("Tüm karakterler çekildi.")
                    print("Karakter sayısı: \(self.characters.count)")
                }
            })
    }

    func getCharacterById(_ id: Int) -> Character? {
        return characters.first { $0.id == id }
    }
}

struct CharacterResponse: Codable {
    let results: [Character]
    let info: PageInfo
}
