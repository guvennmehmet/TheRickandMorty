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

    func fetchCharacters(for location: Location) {
        let dispatchGroup = DispatchGroup()
        var allCharacters: [Character] = []

        for characterURL in location.residents {
            guard let url = URL(string: characterURL) else {
                continue
            }
            dispatchGroup.enter()
            URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .decode(type: Character.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Error decoding character data: \(error)")
                    }
                }, receiveValue: { character in
                    allCharacters.append(character)
                    dispatchGroup.leave()
                })
                .store(in: &cancellables)
        }

        dispatchGroup.notify(queue: .main) {
            self.characters = allCharacters
        }
    }
}
