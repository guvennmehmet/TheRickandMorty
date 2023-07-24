//
//  TheRickandMortyApp.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 21.07.2023.
//

import SwiftUI

@main
struct TheRickandMortyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
