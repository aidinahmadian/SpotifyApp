//
//  NewReleasesCellViewModel.swift
//  Spotify App
//
//  Created by Aidin Ahmadian on 3/16/21.
//

import Foundation

struct NewReleasesCellViewModel: Codable {
    let name: String
    let artworkURL: URL?
    let numberOfTracks: Int
    let artistName: String
}
