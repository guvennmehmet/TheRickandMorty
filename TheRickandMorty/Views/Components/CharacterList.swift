// CharacterList.swift
// TheRickandMorty
//
// Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct CharacterList: View {
    @ObservedObject var characterViewModel: CharacterViewModel

    var body: some View {
        VStack {
            HStack {
                Text("\(characterViewModel.characters.count) \(characterViewModel.characters.count > 1 ? "characters" : "character")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(characterViewModel.characters) { character in
                    NavigationLink(destination: CharacterView(characterViewModel: characterViewModel, characterID: character.id)) {
                        CharacterCard(characterViewModel: characterViewModel, character: character)
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
        .onAppear {
            characterViewModel.fetchCharacters()
        }
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CharacterViewModel()
        viewModel.fetchCharacters()
        
        return ScrollView {
            CharacterList(characterViewModel: viewModel)
        }
    }
}
