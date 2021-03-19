//
//  TitleHeaderCollectionReusableView.swift
//  Spotify App
//
//  Created by Aidin Ahmadian on 3/19/21.
//

import UIKit

class TitleHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "TitleHeaderCollectionReusableView"
    
    private let label: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 23)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //label.frame = CGRect(x: 15, y: 0, width: width-20, height: height)
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    
    func configure(with title: String) {
        label.text = title
    }
    
}
