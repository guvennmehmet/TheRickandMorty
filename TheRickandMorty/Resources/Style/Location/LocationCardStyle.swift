//
//  LocationCardStyle.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 3.08.2023.
//

import SwiftUI

struct LocationCardStyle: ViewModifier {
    let colorTheme = ColorTheme()

    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(colorTheme.red, lineWidth: 2)
            )
            .shadow(color: Color.gray.opacity(0.7), radius: 4, x: 0, y: 4)
    }
}
