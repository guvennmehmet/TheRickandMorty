//
//  EpisodeCard.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 2.08.2023.
//

import SwiftUI

struct EpisodeCard: View {
    var episode: Episode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            LabelTextView(label: "Name: ", value: episode.name)
            LabelTextView(label: "Air Date: ", value: episode.airDate)
            LabelTextView(label: "Episode: ", value: episode.episodeNumber)
            LabelTextView(label: "Created: ", value: episode.created)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.7), radius: 4, x: 0, y: 4)
    }
}

struct EpisodeCard_Previews: PreviewProvider {
    static var previews: some View {
        let episode = Episode(id: 1, name: "Pilot", airDate: "December 2, 2013", episodeNumber: "S01E01", url: "https://rickandmortyapi.com/api/episode/1", created: "2023-08-02T12:00:00Z")
        
        EpisodeCard(episode: episode)
    }
}
