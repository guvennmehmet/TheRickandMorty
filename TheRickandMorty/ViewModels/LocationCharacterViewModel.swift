//
//  LocationCharacterViewModel.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 7.08.2023.
//

import Foundation
import Combine

class LocationCharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []

    private var cancellables: Set<AnyCancellable> = []

    func fetchCharacters(for locationID: Int) {
        guard let url = URL(string: "\(API.characterURL)/?location=\(locationID)") else {
            print("Invalid URL for locationID: \(locationID)")
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
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
            })
            .store(in: &cancellables)
    }
}
