//
//  HomeView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Image("rick_and_morty")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    Text("about")
                }
                .padding()
            }
            .navigationTitle("welcome_title")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
