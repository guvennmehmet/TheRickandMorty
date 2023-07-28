//
//  HomeView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 24.07.2023.
//

import SwiftUI

func fetchCharacters(completion: @escaping ([CharacterModel]) -> ()) {
    let url = URL(string: "https://rickandmortyapi.com/api/character")!
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("error: \(error.localizedDescription)")
            return
        }
        
        if let data = data {
            do {
                let result = try JSONDecoder().decode(CharacterList.self, from: data)
                completion(result.results)
            } catch {
                print("error: \(error.localizedDescription)")
            }
        }
    }.resume()
}

struct HomeView: View {
    
    @State private var characters: [CharacterModel] = []
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            // Background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // Content layer
            VStack(spacing: 0) {
                homeHeader
                Spacer()
                if !characters.isEmpty {
                    CharacterListView(characters: $characters)
                } else {
                    ProgressView()
                }
            }
        }
        .onAppear {
            fetchCharacters { characters in
                self.characters = characters
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: "person")
            Spacer()
            Text("Rick and Morty")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "gearshape")
                .rotationEffect(Angle(degrees: showPortfolio ? 360 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}
