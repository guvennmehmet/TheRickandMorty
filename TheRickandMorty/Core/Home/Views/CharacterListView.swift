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
        List(characters) { character in
            CharacterCardView(imageUrl: URL(string: character.image)!, characterName: character.name)
        }
    }
}
