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

    func search(query: String) {
        searchCharacters(query: query)
        searchLocations(query: query)
        searchEpisodes(query: query)
    }

    private func searchCharacters(query: String) {
        fetchAllItems(urlString: "\(API.characterURL)/?name=\(query)", type: CharacterResponse.self)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { response in
                self.characters = response.flatMap { $0.results }
            })
            .store(in: &cancellables)
    }

    private func searchLocations(query: String) {
        fetchAllItems(urlString: "\(API.locationURL)/?name=\(query)", type: LocationResponse.self)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { response in
                self.locations = response.flatMap { $0.results }
            })
            .store(in: &cancellables)
    }

    private func searchEpisodes(query: String) {
        fetchAllItems(urlString: "\(API.episodeURL)/?name=\(query)", type: EpisodeResponse.self)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { response in
                self.episodes = response.flatMap { $0.results }
            })
            .store(in: &cancellables)
    }

    private func fetchAllItems<T: Codable>(urlString: String, type: T.Type) -> AnyPublisher<[T], Error> {
        var allItems: [T] = []
        var currentPage = 1

        return Future<[T], Error> { promise in
            func fetchNextPage() {
                let pageURL = "\(urlString)&page=\(currentPage)"
                self.fetchItems(urlString: pageURL, type: T.self)
                    .sink(receiveCompletion: { completion in
                        switch completion {
                        case .finished:
                            break
                        case .failure(let error):
                            promise(.failure(error))
                        }
                    }, receiveValue: { items in
                        if items.isEmpty {
                            promise(.success(allItems))
                        } else {
                            allItems.append(contentsOf: items)
                            currentPage += 1
                            fetchNextPage()
                        }
                    })
                    .store(in: &self.cancellables)
            }

            fetchNextPage()
        }
        .eraseToAnyPublisher()
    }

    private func fetchItems<T: Codable>(urlString: String, type: T.Type) -> AnyPublisher<[T], Error> {
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [T].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
