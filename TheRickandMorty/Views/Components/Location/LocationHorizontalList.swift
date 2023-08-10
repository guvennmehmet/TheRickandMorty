//
//  LocationHorizontalList.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 8.08.2023.
//

import SwiftUI

struct LocationHorizontalList: View {
    @ObservedObject var locationViewModel: LocationViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(NSLocalizedString("location_title", comment: ""))
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 15) {
                    ForEach(locationViewModel.locations) { location in
                        NavigationLink(destination: LocationDetailView(locationViewModel: locationViewModel, locationID: location.id)) {
                            LocationCard(location: location)
                        }
                        .id(location.id)
                    }
                    if let lastLocation = locationViewModel.locations.last,
                       let lastFetchedLocation = locationViewModel.locations.last,
                       lastLocation.id == lastFetchedLocation.id {
                        ProgressView()
                            .onAppear {
                                locationViewModel.fetchMoreLocations()
                            }
                    }
                }
                .padding(.horizontal)
            }
            .onAppear {
                locationViewModel.fetchLocations()
            }
        }
        .frame(height: 200)
    }
}

struct LocationHorizontalList_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LocationViewModel()
        viewModel.fetchLocations()
        
        return LocationHorizontalList(locationViewModel: viewModel)
    }
}
