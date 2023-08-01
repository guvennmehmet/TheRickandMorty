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

    func fetchLocations() {
        let url = URL(string: "\(API.baseURL)/location")!

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
                self.locations = response.results
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
