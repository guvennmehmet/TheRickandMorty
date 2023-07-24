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
    
    var firstWordOfCharacterName: String {
            let words = characterName.components(separatedBy: " ")
            return words.first ?? characterName
        }
    
    var body: some View {
            VStack(spacing: 10) {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 130, height: 190)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                }
                
                Text("- \(firstWordOfCharacterName) -")
                    .font(.headline)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
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
