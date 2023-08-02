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

    func fetchEpisodes() {
        let url = URL(string: "\(API.baseURL)/episode?page=\(currentPage)")!

        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: EpisodeResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error decoding data: \(error)")
                }
            }, receiveValue: { response in
                if !response.results.isEmpty {
                    self.episodes.append(contentsOf: response.results)
                    self.currentPage += 1
                    self.fetchEpisodes()
                }
            })
    }
    
    func getEpisodeById(_ id: Int) -> Episode? {
        return episodes.first { $0.id == id }
    }
}

struct EpisodeResponse: Codable {
    let results: [Episode]
    let info: PageInfo
}
