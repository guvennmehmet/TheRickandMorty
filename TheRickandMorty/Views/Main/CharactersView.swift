//
//  CharactersView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct CharactersView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                CharacterList(character: Character.all)
            }
                .navigationTitle("Characters")
        }
        .navigationViewStyle(.stack)
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
