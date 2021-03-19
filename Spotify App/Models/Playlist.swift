//
//  Playlist.swift
//  Spotify App
//
//  Created by Aidin Ahmadian on 3/11/21.
//

import Foundation

struct Playlist: Codable {
    let description: String
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let owner: User
}
