//
//  Search.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 10.08.2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search", text: $searchText)
                .foregroundColor(.primary)
                .keyboardType(.webSearch)
        }
        .padding(8)
        .background(Color(.systemGray5))
        .cornerRadius(10)
        .padding(.horizontal, 15)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
