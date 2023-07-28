//
//  TabBar.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            CharactersView()
                .tabItem {
                    Label("Characters" , systemImage: "person.2")
                }
            
            LocationsView()
                .tabItem {
                    Label("Locations", systemImage: "mappin.circle")
                }
            
            EpisodesView()
                .tabItem {
                    Label("Episodes", systemImage: "tv")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
