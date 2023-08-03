//
//  LocationView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 1.08.2023.
//

import SwiftUI

struct LocationDetailView: View {
    @ObservedObject var locationViewModel: LocationViewModel
    var locationID: Int
    
    init(locationViewModel: LocationViewModel, locationID: Int) {
        self.locationViewModel = locationViewModel
        self.locationID = locationID
    }
    
    var body: some View {
        if let location = locationViewModel.getLocationById(locationID) {
            ScrollView {
                LocationCard(location: location)
            }
            .navigationTitle(location.name)
        } else {
            Text("no_data")
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LocationViewModel()
        viewModel.fetchLocations()
        
        return NavigationView {
            LocationDetailView(locationViewModel: viewModel, locationID: 1)
        }
    }
}
