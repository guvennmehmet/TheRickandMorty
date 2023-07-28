//
//  EpisodesView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct EpisodesView: View {
    var body: some View {
        NavigationView {
            Text("episode screen")
                .navigationTitle("Episodes")
        }
        .navigationViewStyle(.stack)
    }
}

struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesView()
    }
}
