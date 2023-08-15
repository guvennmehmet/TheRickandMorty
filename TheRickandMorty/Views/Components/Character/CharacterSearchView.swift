//
//  SearchView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 10.08.2023.
//

import SwiftUI

struct CharacterSearchView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    @ObservedObject var characterViewModel: CharacterViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    SearchBar(searchText: $searchViewModel.searchText)
                        .padding(.horizontal)
                    
                    Button(action: {
                        searchViewModel.performSearch()
                    }) {
                        Text("Search")
                            .padding()
                            .buttonStyle(SearchButtonStyle())
                    }
                }
                .padding(.top)
                
                ScrollView {
                    SearchedCharacterList(searchViewModel: searchViewModel, characterViewModel: characterViewModel)
                }
                
                Button(action: {
                    searchViewModel.loadMore()
                }) {
                    Text("Load More")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .buttonStyle(CustomLoadMoreButtonStyle())
                }
                .padding(.bottom)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        let searchViewModel = SearchViewModel()
        let characterViewModel = CharacterViewModel()
        
        return CharacterSearchView(searchViewModel: searchViewModel, characterViewModel: characterViewModel)
    }
}
