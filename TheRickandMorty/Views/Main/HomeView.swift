//
//  HomeView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var isShowingSheet: Bool = false
    @State private var isShowingSettings: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Rick and Morty")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    SettingsToolBar(isShowingSettings: $isShowingSettings)
                }
                .padding(.horizontal)
                
                ScrollView {
                    VStack {
                        Button(action: {
                            isShowingSheet.toggle()
                        }) {
                            Text("about")
                        }
                        .buttonStyle(GrowingButtonStyle())
                        .sheet(isPresented: $isShowingSheet) {
                            AboutView()
                        }
                        .padding(10)
                        
                        VStack(spacing: 10) {
                            CharacterHorizontalList(characterViewModel: CharacterViewModel())
                                .padding(.bottom, 10)
                            LocationHorizontalList(locationViewModel: LocationViewModel())
                                .padding(.bottom, 10)
                            EpisodeHorizontalList(episodeViewModel: EpisodeViewModel())
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                UINavigationBar.appearance().backgroundColor = .clear
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    SettingsToolBar(isShowingSettings: $isShowingSettings)
                }
            }
            .sheet(isPresented: $isShowingSettings) {
                SettingsView(showSignInView: .constant(false))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
