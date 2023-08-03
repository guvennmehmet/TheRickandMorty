//
//  CharactersView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var characterViewModel: CharacterViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                CharacterList(characterViewModel: characterViewModel) 
            }
            .navigationTitle("character_title")
        }
        .navigationViewStyle(.stack)
        .onAppear {
            characterViewModel.fetchCharacters()
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CharacterViewModel()

        return CharactersView(characterViewModel: viewModel)
    }
}
