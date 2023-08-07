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
                        .presentationDragIndicator(.visible)
                        .presentationDetents([.medium, .large])
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
