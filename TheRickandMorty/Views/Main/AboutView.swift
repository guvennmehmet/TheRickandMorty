//
//  AboutView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 7.08.2023.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image("rick_and_morty")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Text("rick_and_morty_about")
            }
            .padding()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
