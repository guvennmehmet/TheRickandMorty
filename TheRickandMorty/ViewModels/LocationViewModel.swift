//
//  LocationViewModel.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 1.08.2023.
//

import SwiftUI
import Combine

class LocationViewModel: ObservableObject {
    @Published var locations: [Location] = []

    private var cancellable: AnyCancellable?
    private var currentPage = 1
    private var isLoading = false

    func fetchLocations() {
        if isLoading { return }

        let url = URL(string: "\(API.locationURL)/?page=1")!

        isLoading = true
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: LocationResponse.self, decoder: JSONDecoder())
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
                self.locations = response.results
            })
    }

    func fetchMoreLocations() {
        if isLoading { return }
        currentPage += 1
        
        let url = URL(string: "\(API.locationURL)/?page=\(currentPage)")!
        
        isLoading = true
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: LocationResponse.self, decoder: JSONDecoder())
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
                    self.locations.append(contentsOf: response.results)
                }
            })
    }

    func getLocationById(_ id: Int) -> Location? {
        return locations.first { $0.id == id }
    }
}

struct LocationResponse: Codable {
    let results: [Location]
    let info: PageInfo
}
