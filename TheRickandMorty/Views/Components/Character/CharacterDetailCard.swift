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
                    CustomListRowView(rowLabel: "Status", rowIcon: "circle.fill", rowContent: character.status, rowTintColor: .blue)
                    Divider()
                    CustomListRowView(rowLabel: "Species", rowIcon: "star.fill", rowContent: character.species, rowTintColor: .blue)
                    Divider()
                    CustomListRowView(rowLabel: "Type", rowIcon: "square.fill", rowContent: character.type, rowTintColor: .blue)
                    Divider()
                    CustomListRowView(rowLabel: "Gender", rowIcon: "person.crop.circle.fill", rowContent: character.gender, rowTintColor: .blue)
                    Divider()
                }
                .padding(16)
                
                Group {
                    CustomListRowView(rowLabel: "Origin", rowIcon: "location.fill", rowContent: character.origin.name, rowTintColor: .blue)
                    Divider()
                    CustomListRowView(rowLabel: "Location", rowIcon: "mappin.circle.fill", rowContent: character.location.name, rowTintColor: .blue)
                    Divider()
                }
                .padding(16)
                
                Group {
                    CustomListRowView(rowLabel: "Image", rowIcon: "photo.fill", rowContent: character.image, rowTintColor: .blue)
                    Divider()
                    if let firstEpisode = character.episode.first {
                        CustomListRowView(rowLabel: "First Episode", rowIcon: "play.rectangle.fill", rowContent: firstEpisode, rowTintColor: .blue)
                        Divider()
                    }
                    CustomListRowView(rowLabel: "URL", rowIcon: "link", rowContent: character.url, rowTintColor: .blue)
                    Divider()
                    CustomListRowView(rowLabel: "Created", rowIcon: "calendar", rowContent: character.formattedCreatedDate, rowTintColor: .blue)
                    Divider()
                }
                .padding(16)
            }
        }
    }
}

struct CharacterDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        let exampleCharacter = Character(
            id: 1,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            type: "Scientist",
            gender: "Male",
            origin: CharacterLocationModel(name: "Earth (C-137)", url: ""),
            location: CharacterLocationModel(name: "Earth (Replacement Dimension)", url: ""),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episode: ["https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2"],
            url: "https://rickandmortyapi.com/api/character/1",
            created: "2017-11-04T18:48:46.250Z"
        )
        
        return CharacterDetailCard(character: exampleCharacter)
            .previewLayout(.sizeThatFits)
    }
}
