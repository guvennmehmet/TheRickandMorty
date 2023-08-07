//
//  TextStyle.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 7.08.2023.
//

import Foundation
import SwiftUI

extension Text {
    func firstTitleTextStyle() -> some View {
        self
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.accentColor)
    }
    
    func secondTitleTextStyle() -> some View {
        self
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(Color.accentColor)
            .lineLimit(1)
            .truncationMode(.tail)
    }
    
    func italicTextStyle() -> some View {
        self
            .italic()
    }
}
