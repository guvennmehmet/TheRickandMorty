//
//  LocationList.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 1.08.2023.
//

import SwiftUI

struct LocationList: View {
    @ObservedObject var locationViewModel: LocationViewModel

    var body: some View {
        VStack {
            HStack {
                Text("\(locationViewModel.locations.count) \(locationViewModel.locations.count > 1 ? "locations" : "location")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                Spacer()
            }
            
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(locationViewModel.locations) { location in
                        NavigationLink(destination: LocationView(locationViewModel: locationViewModel, locationID: location.id)) {
                            LocationCard(location: location)
                        }
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
        .onAppear {
            locationViewModel.fetchLocations()
        }
    }
}

struct LocationList_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LocationViewModel()
        viewModel.fetchLocations()
        
        return ScrollView {
            LocationList(locationViewModel: viewModel)
        }
    }
}
