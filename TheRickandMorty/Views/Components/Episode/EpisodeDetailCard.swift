//
//  EpisodeDetailCard.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 3.08.2023.
//

import SwiftUI

struct EpisodeDetailCard: View {
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
                Text(episode.url)
                    .airDateStyle()
                Text(episode.created)
                    .airDateStyle()
            }
            Spacer()
        }
        .modifier(EpisodeCardStyle())
    }
}

struct EpisodeDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        
        
        let sampleEpisode = Episode(
            id: 1,
            name: "Sample Episode",
            airDate: "August 3, 2023",
            episodeNumber: "S02E03",
            url: "https://rickandmortyapi.com/api/episode/1",
            created: "2023-08-03T12:00:00Z"
        )
        
        return EpisodeDetailCard(episode: sampleEpisode)
            .previewLayout(.sizeThatFits)
         
        
        /*
        let viewModel = EpisodeViewModel()
        viewModel.fetchEpisodes()
        
        if let episode = viewModel.episodes.first {
            return AnyView(EpisodeDetailCard(episode: episode)
                .previewLayout(.sizeThatFits))
        } else {
            return AnyView(Text("Loading...")
                .previewLayout(.sizeThatFits))
        }
        */
         
    }
}
