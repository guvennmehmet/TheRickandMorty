//
//  Toolbar.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 10.08.2023.
//

import SwiftUI

struct SearchToolbarItem: View {
    var body: some View {
        NavigationLink(destination: SearchView()) {
            Image(systemName: "magnifyingglass")
        }
    }
}

struct Toolbar_Previews: PreviewProvider {
    static var previews: some View {
        SearchToolbarItem()
    }
}
