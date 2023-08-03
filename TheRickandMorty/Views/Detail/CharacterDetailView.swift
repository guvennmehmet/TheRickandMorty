//
//  CharacterView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject var characterViewModel: CharacterViewModel
    var characterID: Int
    
    init(characterViewModel: CharacterViewModel, characterID: Int) {
        self.characterViewModel = characterViewModel
        self.characterID = characterID
    }
    
    var body: some View {
        if let character = characterViewModel.getCharacterById(characterID) {
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
                    
                    CharacterDetailCard(character: character)
                }
                .padding()
            }
            .navigationTitle(character.name)
        } else {
            Text("no_data")
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CharacterViewModel()
        viewModel.fetchCharacters()
        
        return NavigationView {
            CharacterDetailView(characterViewModel: viewModel, characterID: 1)
        }
    }
}
