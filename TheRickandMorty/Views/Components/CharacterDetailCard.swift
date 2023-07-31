//
//  CharacterDetailCard.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 31.07.2023.
//

import SwiftUI

struct CharacterDetailCard: View {
    var character: Character
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(character.name)
                .font(.title)
                .fontWeight(.bold)
            
            Text("Status: \(character.status)")
                .font(.headline)
            
            Text("Species: \(character.species)")
                .font(.headline)
            
            Text("Type: \(character.type)")
                .font(.headline)
            
            Text("Gender: \(character.gender)")
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Origin:")
                    .font(.headline)
                Text(character.origin.name)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Location:")
                    .font(.headline)
                Text(character.location.name)
            }
            
            Text("Episodes:")
                .font(.headline)
            VStack(alignment: .leading, spacing: 4) {
                ForEach(character.episode, id: \.self) { episodeURL in
                    Text(episodeURL)
                }
            }
            
            Text("Created: \(character.created)")
                .font(.caption)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
}

struct CharacterDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailCard(character: Character.all[0])
            .previewLayout(.sizeThatFits)
    }
}
