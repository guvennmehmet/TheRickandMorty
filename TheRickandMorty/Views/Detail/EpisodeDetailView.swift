//
//  EpisodeDetailView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 2.08.2023.
//

import SwiftUI

struct EpisodeDetailView: View {
    @ObservedObject var episodeViewModel: EpisodeViewModel
    var episodeID: Int
    
    init(episodeViewModel: EpisodeViewModel, episodeID: Int) {
        self.episodeViewModel = episodeViewModel
        self.episodeID = episodeID
    }
    
    var body: some View {
        if let episode = episodeViewModel.getEpisodeById(episodeID) {
            ScrollView {
                EpisodeCard(episode: episode)
            }
            .navigationTitle(episode.name)
        } else {
            Text("no_data")
        }
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EpisodeViewModel()
        viewModel.fetchEpisodes()
        
        return NavigationView {
            EpisodeDetailView(episodeViewModel: viewModel, episodeID: 1)
        }
    }
}
