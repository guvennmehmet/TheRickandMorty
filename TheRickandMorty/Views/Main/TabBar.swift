//
//  TabBar.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct TabBar: View {
    @StateObject private var characterViewModel = CharacterViewModel()
    @StateObject private var locationViewModel = LocationViewModel()
    @StateObject private var episodeViewModel = EpisodeViewModel()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("home_title", systemImage: "house")
                }
            
            CharactersView(characterViewModel: characterViewModel)
                .tabItem {
                    Label("character_title" , systemImage: "person.2")
                }
            
            LocationsView(locationViewModel: locationViewModel)
                .tabItem {
                    Label("location_title", systemImage: "mappin.circle")
                }
            
            EpisodesView(episodeViewModel: episodeViewModel)
                .tabItem {
                    Label("episode_title", systemImage: "tv")
                }
            
            FavoritesView()
                .tabItem {
                    Label("favorite_title", systemImage: "star")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
