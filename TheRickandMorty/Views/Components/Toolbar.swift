//
//  Toolbar.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 10.08.2023.
//

import SwiftUI

struct SearchToolbarItem: View {
    @ObservedObject var searchViewModel: SearchViewModel
    @ObservedObject var characterViewModel: CharacterViewModel

    var body: some View {
        HStack {
            NavigationLink(destination: SearchView(searchViewModel: searchViewModel, characterViewModel: characterViewModel)) {
                Image(systemName: "magnifyingglass")
            }
            NavigationLink(destination: SettingsView()) {
                Image(systemName: "gear")
            }
        }
    }
}

struct Toolbar_Previews: PreviewProvider {
    static var previews: some View {
        let searchViewModel = SearchViewModel()
        let characterViewModel = CharacterViewModel()

        return SearchToolbarItem(searchViewModel: searchViewModel, characterViewModel: characterViewModel)
            .previewLayout(.fixed(width: 300, height: 44)) 
    }
}

