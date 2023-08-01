//
//  TheRickandMortyApp.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 21.07.2023.
//

import SwiftUI

@main
struct TheRickandMortyApp: App {
    @StateObject private var characterViewModel = CharacterViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
              /*  CharactersView(characterViewModel: characterViewModel)
                    .navigationBarHidden(true) */
                TabBar()
            }
        }
    }
}
