//
//  PageInfo.swift
//  TheRickandMorty
//
//  Created by Mehmet Güven on 2.08.2023.
//

import Foundation

struct PageInfo: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
