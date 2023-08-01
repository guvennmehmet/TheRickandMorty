//
//  LocationView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 1.08.2023.
//

import SwiftUI

struct LocationView: View {
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
            Text("Location not found.")
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LocationViewModel()
        viewModel.fetchLocations()
        
        return NavigationView {
            LocationView(locationViewModel: viewModel, locationID: 1)
        }
    }
}
