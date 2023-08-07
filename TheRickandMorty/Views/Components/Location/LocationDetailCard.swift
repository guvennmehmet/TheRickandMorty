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
        VStack(alignment: .leading, spacing: 10) {
            CustomListRowView(rowLabel: "Name", rowIcon: "number", rowContent: location.name, rowTintColor: .blue)
            Divider()
            CustomListRowView(rowLabel: "Type", rowIcon: "tag.fill", rowContent: location.type, rowTintColor: .red)
            Divider()
            CustomListRowView(rowLabel: "Dimension", rowIcon: "globe", rowContent: location.dimension, rowTintColor: .green)
            Divider()
            CustomListRowView(rowLabel: "Url", rowIcon: "link", rowContent: location.url, rowTintColor: .purple)
            Divider()
            CustomListRowView(rowLabel: "Created", rowIcon: "clock", rowContent: location.formattedCreatedDate, rowTintColor: .orange)
            }
        .padding(16)
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
                   created: "2023-08-03"
               )
        
        return LocationDetailCard(location: sampleLocation)
                    .previewLayout(.sizeThatFits)
    }
}
