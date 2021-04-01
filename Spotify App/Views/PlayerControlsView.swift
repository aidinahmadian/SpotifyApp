//
//  PlayerControlsView.swift
//  Spotify App
//
//  Created by Aidin Ahmadian on 4/1/21.
//

import Foundation
import UIKit

protocol PlayerControlsViewDelegate: AnyObject {
    func playerControlsViewDidTapPlayPauseButton(_ playerControlView: PlayerControlsView)
    func playerControlsViewDidTapForwardButton(_ playerControlView: PlayerControlsView)
    func playerControlsViewDidTapBackwardsButton(_ playerControlView: PlayerControlsView)
    func playerControlsView(_ playerControlsView: PlayerControlsView, didSlideSlider value: Float)
}

struct PlayerControlsViewViewModel {
    let title: String?
    let subtitle: String?
}

final class PlayerControlsView: UIView {
    
    private var isPlaying = true
    
    weak var delegate: PlayerControlsViewDelegate?
    
    private let volumeSlider: UISlider = {
        let slider = UISlider()
        slider.value = 0.3
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "Song Name"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Artist"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "backward.end.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34, weight: .regular))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "forward.end.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34, weight: .regular))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private let playPauseButton: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "pause.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 60, weight: .regular))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private let shuffleButton: UIButton = {
        let button = UIButton()
        button.tintColor = #colorLiteral(red: 0.1138881817, green: 0.7236430049, blue: 0.3271158934, alpha: 1)
        let image = UIImage(systemName: "shuffle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14, weight: .regular))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private let repeatButton: UIButton = {
        let button = UIButton()
        button.tintColor = #colorLiteral(red: 0.1138881817, green: 0.7236430049, blue: 0.3271158934, alpha: 1)
        let image = UIImage(systemName: "repeat", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14, weight: .regular))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.tintColor = #colorLiteral(red: 0.1138881817, green: 0.7236430049, blue: 0.3271158934, alpha: 1)
        let image = UIImage(systemName: "heart.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .regular))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        addSubview(nameLabel)
        addSubview(subtitleLabel)
        addSubview(volumeSlider)
        addSubview(backButton)
        addSubview(likeButton)
        addSubview(nextButton)
        addSubview(playPauseButton)
        addSubview(shuffleButton)
        addSubview(repeatButton)
        
        volumeSlider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        playPauseButton.addTarget(self, action: #selector(didTapPlayPause), for: .touchUpInside)
        
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func didSlideSlider(_ slider: UISlider) {
        let value = slider.value
        delegate?.playerControlsView(self, didSlideSlider: value)
    }
    
    @objc private func didTapBack() {
        delegate?.playerControlsViewDidTapBackwardsButton(self)
    }
    
    @objc private func didTapNext() {
        delegate?.playerControlsViewDidTapForwardButton(self)
    }
    
    @objc private func didTapPlayPause() {
        self.isPlaying = !isPlaying
        delegate?.playerControlsViewDidTapPlayPauseButton(self)
        
        //Update Icon
        let pause = UIImage(systemName: "pause.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 60, weight: .regular))
        let play = UIImage(systemName: "play.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 60, weight: .regular))
        playPauseButton.setImage(isPlaying ? pause : play, for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor, constant: -10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor, constant: -10).isActive = true
        subtitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        likeButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -15).isActive = true
        likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        playPauseButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20).isActive = true
        playPauseButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        playPauseButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        playPauseButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        backButton.centerYAnchor.constraint(equalTo: playPauseButton.centerYAnchor).isActive = true
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 85).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 35).isActive = true

        nextButton.centerYAnchor.constraint(equalTo: playPauseButton.centerYAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -85).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        shuffleButton.centerYAnchor.constraint(equalTo: playPauseButton.centerYAnchor).isActive = true
        shuffleButton.trailingAnchor.constraint(equalTo: backButton.leadingAnchor, constant: -30).isActive = true
        shuffleButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        shuffleButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        repeatButton.centerYAnchor.constraint(equalTo: playPauseButton.centerYAnchor).isActive = true
        repeatButton.leadingAnchor.constraint(equalTo: nextButton.trailingAnchor, constant: 30).isActive = true
        repeatButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        repeatButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        volumeSlider.topAnchor.constraint(equalTo: playPauseButton.bottomAnchor, constant: 20).isActive = true
        volumeSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        volumeSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
        volumeSlider.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func configure(with viewModel: PlayerControlsViewViewModel) {
        nameLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
    }
    
}
