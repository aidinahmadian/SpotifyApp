//
//  SearchResultSubtitleTableViewCell.swift
//  Spotify App
//
//  Created by Aidin Ahmadian on 3/27/21.
//

import UIKit
import SDWebImage

class SearchResultSubtitleTableViewCell: UITableViewCell {
    static let identifier = "SearchResultSubtitleTableViewCell"
    
    private let label: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.sizeToFit()
        label.sizeToFit()
        let imageSize: CGFloat = contentView.height-10
        let labelHeight = contentView.height/2
        //iconImageView.frame = CGRect(x: 10, y: 5, width: imageSize, height: imageSize)
        
        iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //label.frame = CGRect(x: iconImageView.right+10, y: 0, width: contentView.width-iconImageView.right-15, height: labelHeight)
        
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        label.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 5).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        subtitleLabel.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: -5).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 5).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        subtitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
//        subtitleLabel.frame = CGRect(x: iconImageView.right+10, y: label.bottom, width: contentView.width-iconImageView.right-15, height: labelHeight)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        subtitleLabel.text = nil
    }
    
    func configure(with viewModel: SearchResultSubtitleTableViewCellViewModel) {
        label.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        iconImageView.sd_setImage(with: viewModel.imageURL, completed: nil)
    }
    
}

