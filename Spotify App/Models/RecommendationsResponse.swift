//
//  RecommendationsResponse.swift
//  Spotify App
//
//  Created by Aidin Ahmadian on 3/15/21.
//

import Foundation

struct RecommendationsResponse: Codable {
    let tracks: [AudioTrack]
}
