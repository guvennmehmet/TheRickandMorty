//
//  SettingsToolBar.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 23.08.2023.
//

import SwiftUI

struct SettingsToolBar: View {
    @Binding var isShowingSettings: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                isShowingSettings.toggle()
            }) {
                Image(systemName: "gearshape")
                    .font(.title)
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}
