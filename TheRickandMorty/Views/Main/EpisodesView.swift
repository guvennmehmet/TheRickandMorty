//
//  EpisodesView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct EpisodesView: View {
    @ObservedObject var episodeViewModel: EpisodeViewModel
    @State var scrollViewOffset: CGFloat = 0
    @State var startOffset: CGFloat = 0
    
    var body: some View {
        NavigationView {
            ScrollViewReader { proxyReader in
                ScrollView(.vertical, showsIndicators: false) {
                    EpisodeList(episodeViewModel: episodeViewModel)
                        .overlay(
                            GeometryReader { proxy -> Color in
                                DispatchQueue.main.async {
                                    if startOffset == 0 {
                                        self.startOffset = proxy.frame(in: .global).minY
                                    }
                                    
                                    let offset = proxy.frame(in: .global).minY
                                    self.scrollViewOffset = offset - startOffset
                                    
                                    print(self.scrollViewOffset)
                                }
                                
                                return Color.clear
                            }
                                .frame(width: 0, height: 0)
                        )
                        .id("SCROLL_TO_TOP")
                }
                .overlay(
                    Button(action: {
                        withAnimation(.spring()) {
                            proxyReader.scrollTo("SCROLL_TO_TOP", anchor: .top)
                        }
                    }, label: {
                        Image(systemName: "arrow.up")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.theme.red)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.09), radius: 5, x: 5, y: 5)
                    })
                    .padding(.trailing)
                    .padding(.bottom, getSafeAreaInsets().bottom == 0 ? 12 : 0)
                    .opacity(min(max(-scrollViewOffset / 100, 0), 1))
                    .animation(.easeInOut, value: scrollViewOffset)
                    ,alignment: .bottomTrailing
                )
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("episode_title")
                                .font(.title)
                            
                            Spacer()
                            
                        }
                    }
                }
            }
            .navigationViewStyle(.stack)
            .onAppear {
                episodeViewModel.fetchEpisodes()
            }
        }
    }
}

struct EpisodessView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EpisodeViewModel()
        
        return EpisodesView(episodeViewModel: viewModel)
    }
}
