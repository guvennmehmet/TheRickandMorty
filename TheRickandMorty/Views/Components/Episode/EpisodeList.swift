//
//  EpisodeList.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 2.08.2023.
//
import SwiftUI

struct EpisodeList: View {
    @ObservedObject var episodeViewModel: EpisodeViewModel

    var body: some View {
        VStack {
            HStack {
                Text("\(episodeViewModel.episodes.count) \(episodeViewModel.episodes.count > 1 ? "episodes" : "episode")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                Spacer()
            }
            
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(episodeViewModel.episodes) { episode in
                        NavigationLink(destination: EpisodeDetailView(episodeViewModel: episodeViewModel, episodeID: episode.id)) {
                            EpisodeCard(episode: episode)
                        }
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
        .onAppear {
            episodeViewModel.fetchEpisodes()
        }
    }
}

struct EpisodeList_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EpisodeViewModel()
        viewModel.fetchEpisodes()
        
        return ScrollView {
            EpisodeList(episodeViewModel: viewModel)
        }
    }
}
