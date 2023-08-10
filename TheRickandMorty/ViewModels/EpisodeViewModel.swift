//
//  EpisodeViewModel.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 2.08.2023.
//

import SwiftUI
import Combine

class EpisodeViewModel: ObservableObject {
    @Published var episodes: [Episode] = []

    private var cancellable: AnyCancellable?
    private var currentPage = 1
    private var isLoading = false

    func fetchEpisodes() {
        if isLoading { return }

        let url = URL(string: "\(API.episodeURL)/?page=\(currentPage)")!

        self.isLoading = true
        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: EpisodeResponse.self, decoder: JSONDecoder())
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
                        self.episodes = response.results
                    } else {
                        self.episodes.append(contentsOf: response.results)
                    }
                }
            })
    }
    
    func fetchMoreEpisodes() {
        if isLoading { return }
        currentPage += 1
            self.fetchEpisodes()
    }
    
    func getEpisodeById(_ id: Int) -> Episode? {
        return episodes.first { $0.id == id }
    }
}

struct EpisodeResponse: Codable {
    let results: [Episode]
    let info: PageInfo
}
