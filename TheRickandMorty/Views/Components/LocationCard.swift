//
//  LocationCard.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 1.08.2023.
//

import SwiftUI

struct LocationCard: View {
    var location: Location
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            LabelTextView(label: "Name: ", value: location.name)
            LabelTextView(label: "Type: ", value: location.type)
            LabelTextView(label: "Dimension: ", value: location.dimension)
            LabelTextView(label: "Created: ", value: location.created)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.7), radius: 4, x: 0, y: 4)
    }
}

struct LabelTextView: View {
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(label)
                .styleLabel()
            
            Text(value)
                .styleValue()
            
            Spacer()
        }
    }
}

extension Text {
    func styleLabel() -> some View {
        self
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(.red)
    }
    
    func styleValue() -> some View {
        self
            .font(.subheadline)
    }
}

struct LocationCard_Previews: PreviewProvider {
    static var previews: some View {
        let location = Location(id: 1, name: "Earth", type: "Planet", dimension: "C-137", residents: [], url: "https://rickandmortyapi.com/api/location/1", created: "2023-08-01T12:00:00Z")
        
        LocationCard(location: location)
    }
}
