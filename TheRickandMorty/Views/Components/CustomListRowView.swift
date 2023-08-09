//
//  CustomListRowView.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 7.08.2023.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: - PROPERTIES
    
    var rowLabel: String
    var rowIcon: String
    var rowContent: String?
    var rowTintColor: Color

    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 30, height: 30)
                    .foregroundColor(rowTintColor)
                Image(systemName: rowIcon)
                    .foregroundColor(.white)
                    .font(.subheadline)
            }

            Text(rowLabel)
                .frame(maxWidth: .infinity, alignment: .leading)

            if let content = rowContent {
                Text(content)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            }
        }
    }
}

struct CustomListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CustomListRowView(
                rowLabel: "Name",
                rowIcon: "globe",
                rowContent: "Mehmet",
                rowTintColor: .pink
            )
            
            CustomListRowView(
                rowLabel: "Version",
                rowIcon: "gear",
                rowContent: "1.0",
                rowTintColor: .purple
            )
        }
    }
}
