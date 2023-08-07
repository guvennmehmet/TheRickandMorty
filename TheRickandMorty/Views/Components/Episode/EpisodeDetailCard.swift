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
        VStack(alignment: .leading, spacing: 10) {
            CustomListRowView(rowLabel: "Number", rowIcon: "number", rowContent: episode.episodeNumber, rowTintColor: .blue)
            Divider()
            CustomListRowView(rowLabel: "Name", rowIcon: "play.tv", rowContent: episode.name, rowTintColor: .red)
            Divider()
            CustomListRowView(rowLabel: "Date", rowIcon: "calendar", rowContent: episode.airDate, rowTintColor: .green)
            Divider()
            CustomListRowView(rowLabel: "Url", rowIcon: "link", rowContent: episode.url, rowTintColor: .purple)
            Divider()
            CustomListRowView(rowLabel: "Created", rowIcon: "clock", rowContent: episode.formattedCreatedDate, rowTintColor: .orange)
            }
        .padding(16)
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
            created: "2023-08-03",
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
