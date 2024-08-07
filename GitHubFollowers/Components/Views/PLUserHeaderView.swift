//
//  PLUserHeaderView.swift
//  GitHubFollowers
//
//  Created by Paulo Lazarini on 06/08/24.
//

import UIKit

class PLUserHeaderView: UIView {
    
    private lazy var avatarImage: PLAvatarImageView = {
        let image = PLAvatarImageView(frame: .zero)
        
        return image
    }()
    
    private lazy var usernameLabel: PLTitleLabel = {
        let label = PLTitleLabel(textAlignment: .left, fontSize: 32)
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var nameLabel: PLBodyLabel = {
        let label = PLBodyLabel(textAlignment: .left)
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var locationLabel: PLBodyLabel = {
        let label = PLBodyLabel(textAlignment: .left)
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var bioLabel: PLBodyLabel = {
        let label = PLBodyLabel(textAlignment: .left)
        label.numberOfLines = 3
        
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        layoutView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(using data: User) {
        usernameLabel.text = data.login
        avatarImage.downloadImage(from: data.avatarUrl)
        if let bio = data.bio { bioLabel.text = bio }
        if let name = data.name { nameLabel.text = name }
        if let location = data.location { locationLabel.text = location }
    }
    
    private func layoutView() {
        addSubview(avatarImage)
        addSubview(stackView)
        addSubview(bioLabel)
        stackView.addArrangedSubview(usernameLabel)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(locationLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            avatarImage.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            avatarImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            avatarImage.topAnchor.constraint(equalTo: topAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: avatarImage.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: avatarImage.bottomAnchor),
            
            bioLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            bioLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16)
        ])
    }
}
