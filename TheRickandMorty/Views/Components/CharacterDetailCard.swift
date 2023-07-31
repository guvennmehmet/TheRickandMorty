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
                .foregroundColor(.red)
            
            HStack {
                Text("Status:")
                    .labelStyle()
                Text(character.status)
                    .font(.headline)
            }
            
            HStack {
                Text("Species:")
                    .labelStyle()
                Text(character.species)
                    .font(.headline)
            }
            
            HStack {
                Text("Type:")
                    .labelStyle()
                Text(character.type)
                    .font(.headline)
            }
            
            HStack {
                Text("Gender:")
                    .labelStyle()
                Text(character.gender)
                    .font(.headline)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Origin:")
                    .labelStyle()
                Text(character.origin.name)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Location:")
                    .labelStyle()
                Text(character.location.name)
            }
            
            HStack {
                Text("Episodes:")
                    .labelStyle()
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(character.episode, id: \.self) { episodeURL in
                        Text(episodeURL)
                    }
                }
            }
            
            HStack {
                Text("Created:")
                    .labelStyle()
                Text(character.created)
                    .font(.caption)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
}

struct LabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.red)
    }
}

extension View {
    func labelStyle() -> some View {
        self.modifier(LabelStyle())
    }
}

struct CharacterDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailCard(character: Character.all[0])
            .previewLayout(.sizeThatFits)
    }
}
