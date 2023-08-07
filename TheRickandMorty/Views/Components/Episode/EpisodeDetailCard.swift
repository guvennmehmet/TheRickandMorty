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
        List {
            CustomListRowView(rowLabel: "Number", rowIcon: "number", rowContent: episode.episodeNumber, rowTintColor: .blue)
            CustomListRowView(rowLabel: "Name", rowIcon: "tv", rowContent: episode.name, rowTintColor: .red)
            CustomListRowView(rowLabel: "Date", rowIcon: "calendar", rowContent: episode.airDate, rowTintColor: .green)
            CustomListRowView(rowLabel: "Created", rowIcon: "clock", rowContent: episode.created, rowTintColor: .orange)
        }
    }
}

struct EpisodeDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        
        
        let sampleEpisode = Episode(
            id: 1,
            name: "Sample Episode",
            airDate: "August 3, 2023",
            episodeNumber: "S02E03",
            url: "",
            created: "2023-08-03T12:00:00Z",
            characterURLs: []

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
