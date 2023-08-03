//
//  LocationDetailCard.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 3.08.2023.
//

import SwiftUI

struct LocationDetailCard: View {
    var location: Location
    let colorTheme = ColorTheme()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(location.name)
                    .locationNameStyle()
                Text(location.type)
                    .locationTypeStyle()
                Text(location.dimension)
                    .locationDimensionStyle()
                Text(location.created)
                    .locationDimensionStyle()
            }
            Spacer()
        }
        .modifier(LocationCardStyle())
    }
}

struct LocationDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        
        let sampleLocation = Location(
                   id: 1,
                   name: "Earth (C-137)",
                   type: "Planet",
                   dimension: "Dimension C-137",
                   residents: [],
                   url: "https://rickandmortyapi.com/api/location/1",
                   created: "2023-08-03T12:00:00Z"
               )
        
        return LocationDetailCard(location: sampleLocation)
                    .previewLayout(.sizeThatFits)
    }
}
