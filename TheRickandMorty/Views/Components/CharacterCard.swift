//
//  CharacterCard.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct CharacterCard: View {
    var character: Character
    
    var firstWordOfCharacterName: String {
        let words = character.name.components(separatedBy: " ")
        return words.first ?? character.name
            }
    
    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 190)
                    .cornerRadius(10)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(width: 140, height: 190)
                    .cornerRadius(10)
            }
            
            Text("- \(firstWordOfCharacterName) -")
                .font(.headline)
                .foregroundColor(.black)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct CharacterCard_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCard(character: Character.all[0])
    }
}
