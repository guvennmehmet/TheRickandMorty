//
//  CharacterCard.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct CharacterCard: View {
    @ObservedObject var characterViewModel: CharacterViewModel
    var character: Character

    init(characterViewModel: CharacterViewModel, character: Character) {
        self.characterViewModel = characterViewModel
        self.character = character
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
            
            Text(character.name)
                .font(.headline)
                .foregroundColor(.black)
                .lineLimit(1)
                .truncationMode(.tail)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct CharacterCard_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CharacterViewModel()
        if let character = viewModel.getCharacterById(1) {
            return AnyView(CharacterCard(characterViewModel: viewModel, character: character))
        } else {
            return AnyView(Text("no_data"))
        }
    }
}
