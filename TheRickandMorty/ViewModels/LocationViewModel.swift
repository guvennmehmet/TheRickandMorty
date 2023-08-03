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

    func fetchLocations() {
        let url = URL(string: "\(API.locationURL)/?page=\(currentPage)")!

        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: LocationResponse.self, decoder: JSONDecoder())
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
                    self.locations.append(contentsOf: response.results)
                    self.currentPage += 1
                    self.fetchLocations()
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
