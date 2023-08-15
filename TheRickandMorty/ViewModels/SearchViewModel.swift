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
    @Published var currentPage = 1
    @Published var totalPageCount = 0

    private var cancellables: Set<AnyCancellable> = []
    
    func performSearch() {
        currentPage = 1
        search(query: searchText)
    }

    func search(query: String, page: Int = 1) {
        searchItems(urlString: "\(API.characterURL)/?name=\(query)&page=\(page)")
            .map { (response: CharacterResponse) in response.results }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { characters in
                if page == 1 {
                    self.characters = characters
                } else {
                    self.characters.append(contentsOf: characters)
                }
                self.totalPageCount = characters.isEmpty ? 0 : self.totalPageCount
            })
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { _ in })
            .store(in: &cancellables)

        searchItems(urlString: "\(API.locationURL)/?name=\(query)&page=\(page)")
            .map { (response: LocationResponse) in response.results }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { locations in
                if page == 1 {
                    self.locations = locations
                } else {
                    self.locations.append(contentsOf: locations)
                }
                self.totalPageCount = locations.isEmpty ? 0 : self.totalPageCount
            })
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { _ in })
            .store(in: &cancellables)
        
        searchItems(urlString: "\(API.episodeURL)/?name=\(query)&page=\(page)")
            .map { (response: EpisodeResponse) in response.results }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { episodes in
                if page == 1 {
                    self.episodes = episodes
                } else {
                    self.episodes.append(contentsOf: episodes)
                }
                self.totalPageCount = episodes.isEmpty ? 0 : self.totalPageCount
            })
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { _ in })
            .store(in: &cancellables)
    }
    
    func loadMore() {
        currentPage += 1
        search(query: searchText, page: currentPage)
    }

    private func searchItems<T: Codable>(urlString: String) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: urlString)!)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
