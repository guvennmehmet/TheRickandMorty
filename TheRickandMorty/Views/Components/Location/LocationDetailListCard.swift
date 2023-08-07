//
//  LocationDetailListCard.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 7.08.2023.
//

import SwiftUI

struct LocationDetailListCard: View {
    var location: Location
    @StateObject private var locationCharacterViewModel = LocationCharacterViewModel()
    @EnvironmentObject var characterViewModel: CharacterViewModel

    var body: some View {
        VStack {
            HStack {
                Text("\(locationCharacterViewModel.characters.count) \(locationCharacterViewModel.characters.count > 1 ? "characters" : "character")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                Spacer()
            }

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15), GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(locationCharacterViewModel.characters) { character in
                    CharacterCard(characterViewModel: characterViewModel, character: character)
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
        .onAppear {
            locationCharacterViewModel.fetchCharacters(for: location)
        }
    }
}

struct LocationDetailListCard_Previews: PreviewProvider {
    static var previews: some View {
        let locationViewModel = LocationViewModel()
        locationViewModel.fetchLocations()

        if let location = locationViewModel.locations.first {
            return ScrollView {
                LocationDetailListCard(location: location)
            }
            .environmentObject(CharacterViewModel())
            .eraseToAnyView()
        } else {
            return AnyView(Text("no_data"))
        }
    }
}
