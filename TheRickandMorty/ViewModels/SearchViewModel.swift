//
//  SearchViewModel.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 14.08.2023.
//

import SwiftUI
import Combine

class SearchViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var locations: [Location] = []
    @Published var episodes: [Episode] = []
    @Published var searchText = ""

    private var cancellables: Set<AnyCancellable> = []
    
    func performSearch() {
        search(query: searchText)
    }

    func search(query: String) {
        searchItems(urlString: "\(API.characterURL)/?name=\(query)")
            .compactMap { (response: CharacterResponse) in response.results }
            .replaceError(with: [])
            .assign(to: &$characters)

        searchItems(urlString: "\(API.locationURL)/?name=\(query)")
            .compactMap { (response: LocationResponse) in response.results }
            .replaceError(with: [])
            .assign(to: &$locations)

        searchItems(urlString: "\(API.episodeURL)/?name=\(query)")
            .compactMap { (response: EpisodeResponse) in response.results }
            .replaceError(with: [])
            .assign(to: &$episodes)
    }

    private func searchItems<T: Codable>(urlString: String) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: urlString)!)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
