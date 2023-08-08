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
            LazyHStack(spacing: 15) {
                ForEach(characterViewModel.characters) { character in
                    NavigationLink(destination: CharacterDetailView(characterViewModel: characterViewModel, characterID: character.id)) {
                        CharacterCard(characterViewModel: characterViewModel, character: character)
                            
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(width: .infinity, height: 300)
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
