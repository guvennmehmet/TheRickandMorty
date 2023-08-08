//
//  LocationHorizontalList.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 8.08.2023.
//

import SwiftUI

struct LocationHorizontalListView: View {
    @ObservedObject var locationViewModel: LocationViewModel

    var body: some View {
        ScrollView(.horizontal) {
            VStack(alignment: .leading, spacing: 10) {
                Text(NSLocalizedString("location_title", comment: ""))
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.leading)
                
                LazyHStack(spacing: 15) {
                    ForEach(locationViewModel.locations) { location in
                        NavigationLink(destination: LocationDetailView(locationViewModel: locationViewModel, locationID: location.id)) {
                            LocationCard(location: location)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 200)
            .onAppear {
                locationViewModel.fetchLocations()
            }
        }
    }
}

struct LocationHorizontalListView_Previews_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LocationViewModel()
        viewModel.fetchLocations()
            
        return LocationHorizontalListView(locationViewModel: viewModel)
    }
}
