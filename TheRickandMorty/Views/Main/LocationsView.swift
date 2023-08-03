//
//  LocationsView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct LocationsView: View {
    @ObservedObject var locationViewModel: LocationViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LocationList(locationViewModel: locationViewModel)
            }
            .navigationTitle("location_title")
        }
        .navigationViewStyle(.stack)
        .onAppear {
            locationViewModel.fetchLocations()
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LocationViewModel()
        
        return LocationsView(locationViewModel: viewModel)
    }
}
