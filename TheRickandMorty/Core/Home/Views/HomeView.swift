//
//  HomeView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 24.07.2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            //background layer
            Color.theme.background
                .ignoresSafeArea()
            
            //content layer
            VStack {
                homeHeader
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: "person")
            Spacer()
            Text("Rick and Morty")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "gearshape")
                .rotationEffect(Angle(degrees: showPortfolio ? 360 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}
