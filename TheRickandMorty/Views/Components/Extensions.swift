//
//  Extensions.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 17.08.2023.
//

import SwiftUI

extension View {
    func getSafeAreaInsets() -> EdgeInsets {
        if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
           let window = windowScene.windows.first(where: { $0.isKeyWindow }) {
            let insets = window.safeAreaInsets
            return EdgeInsets(top: insets.top, leading: insets.left, bottom: insets.bottom, trailing: insets.right)
        }
        
        return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
}
