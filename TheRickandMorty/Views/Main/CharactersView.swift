//
//  CharactersView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 28.07.2023.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var characterViewModel: CharacterViewModel
    @ObservedObject var searchViewModel: SearchViewModel
    @State var scrollViewOffset: CGFloat = 0
    @State var startOffset: CGFloat = 0

    var body: some View {
        NavigationView {
            ScrollViewReader { proxyReader in
                ScrollView(.vertical, showsIndicators: false) {
                    CharacterList(characterViewModel: characterViewModel)
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
                    ScrollToTopButton(scrollViewOffset: $scrollViewOffset, scrollToTopAction: {
                        proxyReader.scrollTo("SCROLL_TO_TOP", anchor: .top)
                    })
                )
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("character_title")
                                .font(.title)
                            Spacer()
                            SearchToolbarItem(searchViewModel: searchViewModel, characterViewModel: characterViewModel)
                        }
                    }
                }
            }
            .navigationViewStyle(.stack)
            .onAppear {
                characterViewModel.fetchCharacters()
            }
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        let characterViewModel = CharacterViewModel()
        let searchViewModel = SearchViewModel()
        
        return CharactersView(characterViewModel: characterViewModel, searchViewModel: searchViewModel)
    }
}
