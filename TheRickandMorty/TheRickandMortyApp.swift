//
//  TheRickandMortyApp.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 21.07.2023.
//

import SwiftUI
import Firebase

@main
struct TheRickandMortyApp: App {
    @StateObject private var characterViewModel = CharacterViewModel()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

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

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      print("Configured Firebase!")

    return true
  }
}
