//
//  CharactersView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var characterViewModel: CharacterViewModel
    @ObservedObject var searchViewModel: SearchViewModel 

    var body: some View {
        NavigationView {
            ScrollView {
                CharacterList(characterViewModel: characterViewModel)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("character_title")
                            .font(.title)
                        
                        Spacer()
                        
                        SearchToolbarItem(searchViewModel: searchViewModel, characterViewModel: characterViewModel)
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .onAppear {
            characterViewModel.fetchCharacters()
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        let characterViewModel = CharacterViewModel()
        let searchViewModel = SearchViewModel()

        return CharactersView(characterViewModel: characterViewModel, searchViewModel: searchViewModel)
    }
}
