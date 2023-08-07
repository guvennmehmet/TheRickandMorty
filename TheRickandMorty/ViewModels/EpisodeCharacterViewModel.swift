//
//  EpisodeCharacterViewModel.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 3.08.2023.
//

import Foundation
import Combine

class EpisodeCharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []

    private var cancellables: Set<AnyCancellable> = []

    func fetchCharacters(for episode: Episode) {
        let dispatchGroup = DispatchGroup()
        var allCharacters: [Character] = []

        for characterURL in episode.characterURLs {
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
