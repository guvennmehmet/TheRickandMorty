//
//  DateFormattable.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 7.08.2023.
//

import Foundation

protocol DateFormattable {
    var created: String { get }
    var formattedCreatedDate: String { get }
}

extension DateFormattable {
    var formattedCreatedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        if let date = formatter.date(from: created) {
            formatter.dateFormat = "dd-MM-yyyy"
            return formatter.string(from: date)
        }

        return created
    }
}
