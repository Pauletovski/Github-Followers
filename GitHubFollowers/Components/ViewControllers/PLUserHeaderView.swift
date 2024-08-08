//
//  PLUserHeaderView.swift
//  GitHubFollowers
//
//  Created by Paulo Lazarini on 06/08/24.
//

import UIKit

final class PLUserHeaderViewController: UIViewController {
    
    private lazy var avatarImageView: PLAvatarImageView = {
        let image = PLAvatarImageView(frame: .zero)
        image.downloadImage(from: user.avatarUrl)
        return image
    }()
    
    private lazy var usernameLabel: PLTitleLabel = {
        let label = PLTitleLabel(textAlignment: .left, fontSize: 34)
        label.text = user.login
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var nameLabel: PLSecondaryTitleLabel = {
        let label = PLSecondaryTitleLabel(fontSize: 18)
        label.text = user.name ?? ""
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var locationLabel: PLSecondaryTitleLabel = {
        let label = PLSecondaryTitleLabel(fontSize: 18)
        if let location = user.location { label.text = "📍 \(location)" }
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var bioLabel: PLBodyLabel = {
        let label = PLBodyLabel(textAlignment: .left)
        label.text = user.bio ?? ""
        label.numberOfLines = 3
        
        return label
    }()
    
    private var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false

        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(avatarImageView)
        view.addSubview(usernameLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
    }
    
    private func setupConstraints() {
        let padding: CGFloat = 24
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bioLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 90)
        ])
    }
}

#Preview {
    PLUserHeaderViewController(user: .mock())
}
