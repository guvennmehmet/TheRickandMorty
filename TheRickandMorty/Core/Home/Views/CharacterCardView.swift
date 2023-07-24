//
//  CharacterCardView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 24.07.2023.
//

import SwiftUI

struct CharacterCardView: View {
    
    var imageUrl: URL
    var characterName: String
    
    var body: some View {
            VStack(spacing: 10) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 200)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                }
                
                Text("- \(characterName) -")
                    .font(.headline)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10)
        } 
    }

struct CharacterCardView_Previews: PreviewProvider {
    static var previews: some View {
        let imageUrl = URL(string: "https://rickandmortyapi.com/api/character/avatar/145.jpeg")!
        let characterName = "Glenn"
        return CharacterCardView(imageUrl: imageUrl, characterName: characterName)
    }
}
