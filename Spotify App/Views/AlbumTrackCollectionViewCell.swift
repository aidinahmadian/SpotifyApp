//
//  AlbumTrackCollectionViewCell.swift
//  Spotify App
//
//  Created by Aidin Ahmadian on 3/19/21.
//

import Foundation
import UIKit

class AlbumTrackCollectionViewCell: UICollectionViewCell {
    static let identifier = "AlbumTrackCollectionViewCell"
    
    private let trackNameLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let artistNameLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let moreButton: UIButton = {
       let button = UIButton()
        let image = UIImage(systemName: "ellipsis", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .light))
        button.setImage(image, for: .normal)
        button.tintColor = .secondaryLabel
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        contentView.backgroundColor = .secondarySystemBackground
        contentView.clipsToBounds = true
        contentView.addSubview(trackNameLabel)
        contentView.addSubview(artistNameLabel)
        contentView.addSubview(moreButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        trackNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6).isActive = true
        trackNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        trackNameLabel.trailingAnchor.constraint(equalTo: moreButton.leadingAnchor, constant: -5).isActive = true
        trackNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        artistNameLabel.topAnchor.constraint(equalTo: trackNameLabel.bottomAnchor, constant: 5).isActive = true
        artistNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo: moreButton.leadingAnchor, constant: -5).isActive = true
        artistNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        moreButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        moreButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        moreButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        trackNameLabel.text = nil
        artistNameLabel.text = nil
    }
    
    func configure(with viewModel: AlbumCollectionViewCellViewModel) {
        trackNameLabel.text = viewModel.name
        artistNameLabel.text = viewModel.artistName
    }
}
