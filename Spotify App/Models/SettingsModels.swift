//
//  SettingsModels.swift
//  Spotify App
//
//  Created by Aidin Ahmadian on 3/14/21.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
