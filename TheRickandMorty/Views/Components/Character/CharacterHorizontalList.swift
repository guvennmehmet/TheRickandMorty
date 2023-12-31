//
//  CharacterHorizontalList.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 8.08.2023.
//

import SwiftUI

struct CharacterHorizontalList: View {
    @ObservedObject var characterViewModel: CharacterViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(NSLocalizedString("character_title", comment: ""))
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading)
            
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 15) {
                        ForEach(characterViewModel.characters) { character in
                            NavigationLink(destination: CharacterDetailView(characterViewModel: characterViewModel, characterID: character.id)) {
                                CharacterCard(characterViewModel: characterViewModel, character: character)
                            }
                            .id(character.id)
                            .onAppear {
                                if character.id == characterViewModel.characters.last?.id {
                                    characterViewModel.fetchMoreCharacters()
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .onAppear {
                    characterViewModel.fetchCharacters()
                }
            }
        .frame(height: 320)
    }
}

struct CharacterHorizontalList_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CharacterViewModel()
        viewModel.fetchCharacters()
        
        return CharacterHorizontalList(characterViewModel: viewModel)
    }
}
