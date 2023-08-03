//
//  LocationTextStyle.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 3.08.2023.
//

import Foundation
import SwiftUI

extension Text {
    func locationNameStyle() -> some View {
        self
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.accentColor)
    }
    
    func locationTypeStyle() -> some View {
        self
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(Color.accentColor)
            .lineLimit(1)
            .truncationMode(.tail)
    }
    
    func locationDimensionStyle() -> some View {
        self
            .italic()
    }
}
