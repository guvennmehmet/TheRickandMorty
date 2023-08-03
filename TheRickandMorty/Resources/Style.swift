//
//  Style.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 3.08.2023.
//

import Foundation
import SwiftUI

extension Text {
    func episodeNumberStyle() -> some View {
        self
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.accentColor)
    }
    
    func episodeNameStyle() -> some View {
        self
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(Color.accentColor)
            .lineLimit(1)
            .truncationMode(.tail)
    }
    
    func airDateStyle() -> some View {
        self
            .italic()
    }
}
