//
//  PlaylistHeaderCollectionReusableView.swift
//  Spotify App
//
//  Created by Aidin Ahmadian on 3/18/21.
//

import SDWebImage
import UIKit

protocol PlaylistHeaderCollectionReusableViewDelegate: AnyObject {
    
    func playlistHeaderCollectionReusableViewDidTapPlayAll(_ header: PlaylistHeaderCollectionReusableView)
}

final class PlaylistHeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "PlaylistHeaderCollectionReusableView"
    
    weak var delegate: PlaylistHeaderCollectionReusableViewDelegate?
    
    private let playlistImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "photo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private let ownerLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private let userImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "spotifyicon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let playlistInfoLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.text = "16,489 likes • 1h 23m" //It's hard coded!! (‹‹not receiving the correct information from SP's server!!!!!››)
        return label
    }()
    
    private let playAllButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1138881817, green: 0.7236430049, blue: 0.3271158934, alpha: 1)
        let image = UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .regular))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapPlayAll), for: .touchUpInside)
        return button
    }()
    
    private let littleShuffleButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1138881817, green: 0.7236430049, blue: 0.3271158934, alpha: 1)
        let image = UIImage(systemName: "shuffle.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 36, weight: .regular))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 13
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapPlayAll), for: .touchUpInside)
        return button
    }()
    
    private let faveButton: UIButton = {
       let button = UIButton()
        let image = UIImage(systemName: "heart.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .regular))
        button.setImage(image, for: .normal)
        button.tintColor = .systemGreen
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapPlayAll), for: .touchUpInside)
        return button
    }()
    
    private let downloadButton: UIButton = {
       let button = UIButton()
        let image = UIImage(systemName: "arrow.down.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .regular))
        button.setImage(image, for: .normal)
        button.tintColor = .secondaryLabel
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapPlayAll), for: .touchUpInside)
        return button
    }()
    
    private let moreButton: UIButton = {
       let button = UIButton()
        let image = UIImage(systemName: "ellipsis", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .regular))
        button.setImage(image, for: .normal)
        button.tintColor = .secondaryLabel
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapPlayAll), for: .touchUpInside)
        return button
    }()
    
    // MARK - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(playlistImageView)
        //addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(ownerLabel)
        addSubview(userImageView)
        addSubview(playlistInfoLabel)
        addSubview(playAllButton)
        addSubview(littleShuffleButton)
        addSubview(faveButton)
        addSubview(downloadButton)
        addSubview(moreButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapPlayAll() {
        delegate?.playlistHeaderCollectionReusableViewDidTapPlayAll(self)
        HapticsManager.shared.vibrateForSelection()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playlistImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        playlistImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        playlistImageView.widthAnchor.constraint(equalToConstant: 216).isActive = true
        playlistImageView.heightAnchor.constraint(equalToConstant: 216).isActive = true
        
//        nameLabel.topAnchor.constraint(equalTo: playlistImageView.bottomAnchor, constant: 5).isActive = true
//        nameLabel.leadingAnchor.constraint(equalTo: playlistImageView.leadingAnchor).isActive = true
//        nameLabel.trailingAnchor.constraint(equalTo: playlistImageView.trailingAnchor).isActive = true
//        nameLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: playlistImageView.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true

        ownerLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5).isActive = true
        ownerLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        ownerLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        ownerLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 5).isActive = true
        
        //userImageView.topAnchor.constraint(equalTo: ownerLabel.topAnchor).isActive = true
        userImageView.centerYAnchor.constraint(equalTo: ownerLabel.centerYAnchor).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 22).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        playlistInfoLabel.topAnchor.constraint(equalTo: ownerLabel.bottomAnchor, constant: 5).isActive = true
        playlistInfoLabel.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor).isActive = true
        playlistInfoLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        littleShuffleButton.bottomAnchor.constraint(equalTo: faveButton.bottomAnchor).isActive = true
        littleShuffleButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        littleShuffleButton.widthAnchor.constraint(equalToConstant: 26).isActive = true
        littleShuffleButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        playAllButton.bottomAnchor.constraint(equalTo: faveButton.bottomAnchor).isActive = true
        playAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        playAllButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        playAllButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        faveButton.topAnchor.constraint(equalTo: playlistInfoLabel.bottomAnchor, constant: 5).isActive = true
        faveButton.leadingAnchor.constraint(equalTo: playlistInfoLabel.leadingAnchor).isActive = true
        faveButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        faveButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        downloadButton.topAnchor.constraint(equalTo: playlistInfoLabel.bottomAnchor, constant: 5).isActive = true
        downloadButton.leadingAnchor.constraint(equalTo: faveButton.trailingAnchor, constant: 30).isActive = true
        downloadButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        downloadButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        moreButton.topAnchor.constraint(equalTo: playlistInfoLabel.bottomAnchor, constant: 5).isActive = true
        moreButton.leadingAnchor.constraint(equalTo: downloadButton.trailingAnchor, constant: 30).isActive = true
        moreButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        moreButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func configure(with viewModel: PlaylistHeadeViewViewModel) {
        nameLabel.text = viewModel.name
        ownerLabel.text = viewModel.ownerName
        descriptionLabel.text = viewModel.description
        playlistImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
    }
}
