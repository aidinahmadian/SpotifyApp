//
//  LibraryToggleView.swift
//  Spotify App
//
//  Created by Aidin Ahmadian on 4/7/21.
//

import UIKit

protocol LibraryToggleViewDelegate: AnyObject {
    func libraryToggleViewDidTapPlaylists(_ toggleView: LibraryToggleView)
    func libraryToggleViewDidTapAlbums(_ toggleView: LibraryToggleView)
}

class LibraryToggleView: UIView {
    
    weak var delegate: LibraryToggleViewDelegate
    
    private let playlistButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Playlists", for: .normal)
        return button
    }()

    private let albumsButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Albums", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(playlistButton)
        addSubview(albumsButton)
        
        playlistButton.addTarget(self, action: #selector(didTapPlaylists), for: .touchUpInside)
        albumsButton.addTarget(self, action: #selector(didTapAlbums), for: .touchUpInside)
    }
    
    @objc private func didTapPlaylists() {
        delegate.libraryToggleViewDidTapPlaylists(self)
    }
    
    @objc private func didTapAlbums() {
        delegate.libraryToggleViewDidTapAlbums(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        playlistButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        albumsButton.frame = CGRect(x: playlistButton.right, y: 0, width: 100, height: 50)
    }
    
}
