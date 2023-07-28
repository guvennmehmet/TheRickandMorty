//
//  LocationsView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct LocationsView: View {
    var body: some View {
        NavigationView {
            Text("location screen")
                .navigationTitle("Locations")
        }
        .navigationViewStyle(.stack)
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
