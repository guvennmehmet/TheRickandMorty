//
//  SearchView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 10.08.2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    @ObservedObject var characterViewModel: CharacterViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchViewModel.searchText)
                    .padding(.horizontal)
                    .padding(.top)
                
                ScrollView {
                    SearchedCharacterList(searchViewModel: searchViewModel, characterViewModel: characterViewModel)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        let searchViewModel = SearchViewModel()
        let characterViewModel = CharacterViewModel()
        
        return SearchView(searchViewModel: searchViewModel, characterViewModel: characterViewModel)
    }
}
