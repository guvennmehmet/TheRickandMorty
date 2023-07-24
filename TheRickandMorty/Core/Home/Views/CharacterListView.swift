//
//  CharacterListView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 24.07.2023.
//

import SwiftUI

struct CharacterListView: View {
    @Binding var characters: [CharacterModel]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                ForEach(characters) { character in
                    CharacterCardView(imageUrl: URL(string: character.image)!, characterName: character.name)
                }
            }
            .padding(16)
        }
    }
}
