//
//  HomeView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var isShowingSheet: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Button(action: {
                        isShowingSheet.toggle()
                    }) {
                        Text("about")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $isShowingSheet) {
                        AboutView()
                            //.presentationDragIndicator(.visible)
                            //.presentationDetents([.medium, .large])
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
            .navigationTitle("Rick and Morty")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
