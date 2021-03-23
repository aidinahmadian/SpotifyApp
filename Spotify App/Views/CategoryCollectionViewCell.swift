//
//  GenreCollectionViewCell.swift
//  Spotify App
//
//  Created by Aidin Ahmadian on 3/22/21.
//

import UIKit
import SDWebImage

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GenreCollectionViewCell"
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "music.quarternote.3", withConfiguration: UIImage.SymbolConfiguration(pointSize: 50, weight: .regular))
        imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/5))
        //imageView.backgroundColor = .green
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        //label.backgroundColor = .red
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private let colors: [UIColor] = [
        .systemBlue,
            .systemPink,
        .systemGray,
        .systemGreen,
        .systemRed,
        .systemPurple,
        .systemOrange,
        .systemYellow,
            .darkGray,
        .systemTeal
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 4
        contentView.layer.masksToBounds = true
        contentView.addSubview(imageView)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        imageView.image = UIImage(systemName: "music.quarternote.3", withConfiguration: UIImage.SymbolConfiguration(pointSize: 50, weight: .regular))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //label.frame = CGRect(x: 10, y: (contentView.height)/2, width: contentView.width-20, height: contentView.height/2)
        //imageView.frame = CGRect(x: contentView.width/2, y: 10, width: contentView.width/2, height: contentView.height/2)
        
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        label.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -15).isActive = true
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 15).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func configure(with viewModel: GenreCollectionViewCellViewModel) {
        label.text = viewModel.title
        imageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
        contentView.backgroundColor = colors.randomElement()
    }
    
}
