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
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let ownerLabel: UILabel = {
       let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    private let playlistImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "photo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let playAllButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .systemGreen
        let image = UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapPlayAll), for: .touchUpInside)
        return button
    }()
    
    // MARK - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        //backgroundColor = .systemPink
        addSubview(playlistImageView)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(ownerLabel)
        addSubview(playAllButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapPlayAll() {
        delegate?.playlistHeaderCollectionReusableViewDidTapPlayAll(self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        playlistImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        playlistImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        playlistImageView.widthAnchor.constraint(equalToConstant: 216).isActive = true
        playlistImageView.heightAnchor.constraint(equalToConstant: 216).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: playlistImageView.bottomAnchor, constant: 5).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: playlistImageView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: playlistImageView.trailingAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true

        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        //descriptionLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: ownerLabel.topAnchor, constant: -5).isActive = true

        ownerLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5).isActive = true
        ownerLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
        ownerLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        ownerLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        playAllButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5).isActive = true
        playAllButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        playAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        playAllButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        playAllButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func configure(with viewModel: PlaylistHeadeViewViewModel) {
        nameLabel.text = viewModel.name
        ownerLabel.text = viewModel.ownerName
        descriptionLabel.text = viewModel.description
        playlistImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
    }
    
}
