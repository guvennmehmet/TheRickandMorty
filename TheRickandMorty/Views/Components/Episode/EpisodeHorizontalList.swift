//
//  EpisodeHorizontalList.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 8.08.2023.
//

import SwiftUI

struct EpisodeHorizontalList: View {
    @ObservedObject var episodeViewModel: EpisodeViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(NSLocalizedString("episode_title", comment: ""))
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 15) {
                    ForEach(episodeViewModel.episodes) { episode in
                        NavigationLink(destination: EpisodeDetailView(episodeViewModel: episodeViewModel, episodeID: episode.id)) {
                            EpisodeCard(episode: episode)
                        }
                        .id(episode.id)
                    }
                    if let lastEpisode = episodeViewModel.episodes.last,
                       let lastFetchedEpisode = episodeViewModel.episodes.last,
                       lastEpisode.id == lastFetchedEpisode.id {
                        ProgressView()
                            .onAppear {
                                episodeViewModel.fetchMoreEpisodes()
                            }
                    }
                }
                .padding(.horizontal)
            }
            .onAppear {
                episodeViewModel.fetchEpisodes()
            }
        }
        .frame(height: 200)
    }
}

struct EpisodeHorizontalList_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EpisodeViewModel()
        viewModel.fetchEpisodes()
            
        return EpisodeHorizontalList(episodeViewModel: viewModel)
    }
}
