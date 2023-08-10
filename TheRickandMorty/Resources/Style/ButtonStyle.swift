//
//  ButtonStyle.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 10.08.2023.
//

import SwiftUI

struct GrowingButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}
