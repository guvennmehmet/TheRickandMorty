//
//  EpisodeDetailListCard.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 3.08.2023.
//

import SwiftUI

struct EpisodeDetailListCard: View {
    var episode: Episode
    @StateObject private var episodeCharacterViewModel = EpisodeCharacterViewModel()
    @EnvironmentObject var characterViewModel: CharacterViewModel

    var body: some View {
        VStack {
            HStack {
                Text("\(episodeCharacterViewModel.characters.count) \(episodeCharacterViewModel.characters.count > 1 ? "characters" : "character")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                Spacer()
            }

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15), GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(episodeCharacterViewModel.characters) { character in
                    CharacterCard(characterViewModel: characterViewModel, character: character)
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
        .onAppear {
            episodeCharacterViewModel.fetchCharacters(for: episode)
        }
    }
}

struct EpisodeDetailListCard_Previews: PreviewProvider {
    static var previews: some View {
        let episodeViewModel = EpisodeViewModel()
        episodeViewModel.fetchEpisodes()

        if let episode = episodeViewModel.episodes.first {
            return ScrollView {
                EpisodeDetailListCard(episode: episode)
            }
            .environmentObject(CharacterViewModel())
            .eraseToAnyView()
        } else {
            return AnyView(Text("no_data"))
        }
    }
}

extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
