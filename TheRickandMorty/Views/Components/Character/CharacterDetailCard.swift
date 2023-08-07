//
//  CharacterDetailCard.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 31.07.2023.
//

import SwiftUI

struct CharacterDetailCard: View {
    var character: Character
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                Group {
                    CustomListRowView(rowLabel: "Name", rowIcon: "person.fill", rowContent: character.name, rowTintColor: .blue)
                    Divider()
                    CustomListRowView(rowLabel: "Status", rowIcon: "circle.fill", rowContent: character.status, rowTintColor: .red)
                    Divider()
                    CustomListRowView(rowLabel: "Species", rowIcon: "star.fill", rowContent: character.species, rowTintColor: .green)
                    Divider()
                    CustomListRowView(rowLabel: "Type", rowIcon: "square.fill", rowContent: character.type, rowTintColor: .purple)
                    Divider()
                    CustomListRowView(rowLabel: "Gender", rowIcon: "person.crop.circle.fill", rowContent: character.gender, rowTintColor: .orange)
                    Divider()
                }
                
                Group {
                    CustomListRowView(rowLabel: "Origin", rowIcon: "location.fill", rowContent: character.origin.name, rowTintColor: .pink)
                    Divider()
                    CustomListRowView(rowLabel: "Location", rowIcon: "mappin.circle.fill", rowContent: character.location.name, rowTintColor: .gray)
                    Divider()
                    CustomListRowView(rowLabel: "Created", rowIcon: "calendar", rowContent: character.formattedCreatedDate, rowTintColor: .brown)
                    Divider()
                }
            }
            .padding(16)
        }
    }
}

struct CharacterDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CharacterViewModel()
                viewModel.fetchCharacters()
        if let character = viewModel.characters.first {
                    return AnyView(CharacterDetailCard(character: character)
                        .previewLayout(.sizeThatFits))
                } else {
                    return AnyView(Text("Loading...")
                        .previewLayout(.sizeThatFits))
                }
    }
}
