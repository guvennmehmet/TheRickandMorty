//
//  ScrollToTopButton.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 17.08.2023.
//

import SwiftUI

struct ScrollToTopButton: View {
    @Binding var scrollViewOffset: CGFloat
    var scrollToTopAction: () -> Void

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    withAnimation(.spring()) {
                        scrollToTopAction()
                    }
                }) {
                    Image(systemName: "arrow.up")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.theme.red)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.09), radius: 5, x: 5, y: 5)
                }
                .offset(x: -16, y: -16)
                .opacity(min(max(-scrollViewOffset / 100, 0), 1))
                .animation(.easeInOut, value: scrollViewOffset)
            }
        }
    }
}
