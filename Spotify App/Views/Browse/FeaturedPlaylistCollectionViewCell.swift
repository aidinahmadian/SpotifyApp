//
//  FeaturedPlaylistCollectionViewCell.swift
//  Spotify App
//
//  Created by Aidin Ahmadian on 3/16/21.
//

import UIKit

class FeaturedPlaylistCollectionViewCell: UICollectionViewCell {
    static let identifier = "FeaturedPlaylistCollectionViewCell"
    
    private let playlistCoverImageView: UIImageView = {
      let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let playlistNameLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let creatorNameLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.addSubview(playlistCoverImageView)
        contentView.addSubview(playlistNameLabel)
        contentView.addSubview(creatorNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        playlistCoverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        playlistCoverImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        playlistCoverImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        playlistCoverImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        playlistNameLabel.topAnchor.constraint(equalTo: playlistCoverImageView.bottomAnchor, constant: 5).isActive = true
        playlistNameLabel.bottomAnchor.constraint(equalTo: creatorNameLabel.topAnchor, constant: 0).isActive = true
        playlistNameLabel.leadingAnchor.constraint(equalTo: playlistCoverImageView.leadingAnchor, constant: 0).isActive = true
        playlistNameLabel.trailingAnchor.constraint(equalTo: playlistCoverImageView.trailingAnchor, constant: 0).isActive = true
        playlistNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        creatorNameLabel.topAnchor.constraint(equalTo: playlistNameLabel.bottomAnchor, constant: 0).isActive = true
        creatorNameLabel.leadingAnchor.constraint(equalTo: playlistCoverImageView.leadingAnchor, constant: 0).isActive = true
        creatorNameLabel.trailingAnchor.constraint(equalTo: playlistCoverImageView.trailingAnchor, constant: 0).isActive = true
        creatorNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        playlistNameLabel.text = nil
        playlistCoverImageView.image = nil
        creatorNameLabel.text = nil
    }
    
    func configure(with viewModel: FeaturedPlaylistCellViewModel) {
        playlistNameLabel.text = viewModel.name
        creatorNameLabel.text = viewModel.creatorName
        playlistCoverImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
    }
}
