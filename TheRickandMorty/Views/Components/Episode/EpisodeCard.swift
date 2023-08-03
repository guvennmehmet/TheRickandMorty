//
//  EpisodeCard.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 2.08.2023.
//

import SwiftUI

struct EpisodeCard: View {
    var episode: Episode
    let colorTheme = ColorTheme()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Episode \(episode.episodeNumber)")
                    .episodeNumberStyle()
                Text(episode.name)
                    .episodeNameStyle()
                Text(episode.airDate)
                    .airDateStyle()
            }
            Spacer()
        }
        .padding() 
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(colorTheme.green, lineWidth: 2)
        )
        .shadow(color: Color.gray.opacity(0.7), radius: 4, x: 0, y: 4)
    }
}

struct EpisodeCard_Previews: PreviewProvider {
    static var previews: some View {
        let episode = Episode(id: 1, name: "Pilot", airDate: "December 2, 2013", episodeNumber: "S01E01", url: "https://rickandmortyapi.com/api/episode/1", created: "2023-08-02T12:00:00Z")
        
        return EpisodeCard(episode: episode)
    }
}
