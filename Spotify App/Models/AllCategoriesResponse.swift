//
//  AllCategoriesResponse.swift
//  Spotify App
//
//  Created by Aidin Ahmadian on 3/23/21.
//

import Foundation

struct AllCategoriesResponse: Codable {
    let categories: Categories
}

struct Categories: Codable {
    let items: [Category]
}

struct Category: Codable {
    let id: String
    let name: String
    let icons: [APIImage]
}
