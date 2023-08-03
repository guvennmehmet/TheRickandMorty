//
//  LocationCard.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 1.08.2023.
//

import SwiftUI

struct LocationCard: View {
    var location: Location
    let colorTheme = ColorTheme()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Location \(location.name)")
                    .locationNameStyle()
                Text(location.type)
                    .locationTypeStyle()
                Text(location.dimension)
                    .locationDimensionStyle()
            }
            Spacer()
        }
        .modifier(LocationCardStyle())
    }
}

struct LocationCard_Previews: PreviewProvider {
    static var previews: some View {
        let location = Location(id: 1, name: "Earth", type: "Planet", dimension: "C-137", residents: [], url: "https://rickandmortyapi.com/api/location/1", created: "2023-08-01T12:00:00Z")
        
        LocationCard(location: location)
    }
}
