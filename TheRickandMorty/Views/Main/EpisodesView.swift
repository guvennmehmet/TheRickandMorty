//
//  EpisodesView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct EpisodesView: View {
    @ObservedObject var episodeViewModel: EpisodeViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                EpisodeList(episodeViewModel: episodeViewModel)
            }
            .navigationTitle("Episodes")
        }
        .navigationViewStyle(.stack)
        .onAppear {
            episodeViewModel.fetchEpisodes()
        }
    }
}

struct EpisodessView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EpisodeViewModel()
        
        return EpisodesView(episodeViewModel: viewModel)
    }
}
