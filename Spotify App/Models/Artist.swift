//
//  Artist.swift
//  Spotify App
//
//  Created by Aidin Ahmadian on 3/11/21.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let images: [APIImage]?
    let external_urls: [String: String]
}
