//
//  PlayBackPresenter.swift
//  Spotify App
//
//  Created by Aidin Ahmadian on 3/31/21.
//

import Foundation
import  UIKit

final class PlayBackPresenter {
    
    static func startPlayback(from viewController: UIViewController, track: AudioTrack ) {
        let vc = PlayerViewController()
        vc.title = track.name
        viewController.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
    static func startPlayback(from viewController: UIViewController, tracks: [AudioTrack] ) {
        let vc = PlayerViewController()
        viewController.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
}
