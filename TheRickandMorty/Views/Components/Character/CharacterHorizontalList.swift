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
        ScrollView(.horizontal) {
            VStack(alignment: .leading, spacing: 10) {
                Text(NSLocalizedString("character_title", comment: ""))
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.leading)
                
                LazyHStack(spacing: 15) {
                    ForEach(characterViewModel.characters) { character in
                        NavigationLink(destination: CharacterDetailView(characterViewModel: characterViewModel, characterID: character.id)) {
                            CharacterCard(characterViewModel: characterViewModel, character: character)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .frame(height: 320)
        .onAppear {
            characterViewModel.fetchCharacters()
        }
    }
}

struct CharacterHorizontalList_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CharacterViewModel()
        viewModel.fetchCharacters()
        
        return CharacterHorizontalList(characterViewModel: viewModel)
    }
}
