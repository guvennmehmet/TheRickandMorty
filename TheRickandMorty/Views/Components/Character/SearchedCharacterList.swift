//
//  SearchedCharacterList.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 14.08.2023.
//

import SwiftUI

struct SearchedCharacterList: View {
    @ObservedObject var searchViewModel: SearchViewModel
    @ObservedObject var characterViewModel: CharacterViewModel

    var body: some View {
        VStack {
            HStack {
                Text("\(searchViewModel.characters.count) \(searchViewModel.characters.count > 1 ? "characters" : "character")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                Spacer()
            }
            
            if searchViewModel.characters.isEmpty {
                Text("No characters found")
                    .padding()
            } else {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                    ForEach(searchViewModel.characters) { character in
                        NavigationLink(destination: CharacterDetailView(characterViewModel: characterViewModel, characterID: character.id)) {
                            CharacterCard(characterViewModel: characterViewModel, character: character)
                        }
                    }
                }
                .padding(.top)
            }
            
            if searchViewModel.currentPage < searchViewModel.totalPageCount {
                Button(action: {
                    searchViewModel.loadMore()
                }) {
                    Text("Load More")
                        .foregroundColor(.blue)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct SearchedCharacterList_Previews: PreviewProvider {
    static var previews: some View {
        let searchViewModel = SearchViewModel()
        let characterViewModel = CharacterViewModel()

        return SearchedCharacterList(searchViewModel: searchViewModel, characterViewModel: characterViewModel)
    }
}
