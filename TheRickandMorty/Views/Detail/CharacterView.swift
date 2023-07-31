//
//  CharacterView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct CharacterView: View {
    var character: Character
    
    var body: some View {
        ScrollView {
            VStack() {
                ZStack(alignment: .top) {
                    AsyncImage(url: URL(string: character.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .cornerRadius(20)
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 300)
                            .foregroundColor(Color.gray.opacity(0.5))
                            .overlay(
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white.opacity(0.7))
                        )
                    }
                }
                .ignoresSafeArea(.container, edges: .top)
                
                    CharacterDetailCard(character: Character.all[0])
            }
            .padding()
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(character: Character.all[0])
    }
}
