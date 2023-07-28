//
//  CharacterList.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct CharacterList: View {
    var character: [Character]
    
    var body: some View {
        VStack {
            HStack {
                Text("\(character.count) \(character.count > 1 ? "character" : "character")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(character) { character in
                    NavigationLink(destination: CharacterView(character: character)) {
                        CharacterCard(character: character)
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            CharacterList(character: Character.all)
        }
    }
}
