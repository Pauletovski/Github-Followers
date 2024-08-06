//
//  UserInfoViewController.swift
//  GitHubFollowers
//
//  Created by Paulo Lazarini on 06/08/24.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var username: String!
    var user: User?
    
    private lazy var userHeader: PLUserHeaderView = {
        let view = PLUserHeaderView(frame: .zero)
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissViewController))
        navigationItem.rightBarButtonItem = doneButton
        
        getUserInfo(username: username)
        configureUserHeader()
    }
    
    func getUserInfo(username: String) {
        showLoadingView()
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            self?.dismissLoadingView()
            guard let self else { return }
            
            switch result {
            case .success(let user):
                self.user = user
            case .failure(let error):
                self.presentPLAlertOnMainThread(title: "ERROR!", message: error.rawValue)
            }
        }
    }
    
    func configureUserHeader() {
        view.addSubview(userHeader)
        
        NSLayoutConstraint.activate([
            userHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            userHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }
}

class PLUserHeaderView: UIView {
    
    var user: User = .mock()
    
    private lazy var avatarImage: PLAvatarImageView = {
        let image = PLAvatarImageView(frame: .zero)
        image.downloadImage(from: user.avatarUrl)
        
        return image
    }()
    
    private lazy var usernameLabel: PLTitleLabel = {
        let label = PLTitleLabel(textAlignment: .left, fontSize: 32)
        label.text = user.login
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var nameLabel: PLBodyLabel = {
        let label = PLBodyLabel(textAlignment: .left)
        label.text = user.name
        
        return label
    }()
    
    private lazy var locationLabel: PLBodyLabel = {
        let label = PLBodyLabel(textAlignment: .left)
        label.text = "📍 \(user.location!)"
        
        return label
    }()
    
    private lazy var bioLabel: PLBodyLabel = {
        let label = PLBodyLabel(textAlignment: .left)
        label.text = user.bio
        
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
    
    func layoutView() {
        addSubview(avatarImage)
        addSubview(usernameLabel)
        addSubview(nameLabel)
        addSubview(locationLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            avatarImage.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            avatarImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            avatarImage.topAnchor.constraint(equalTo: topAnchor),
            
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            usernameLabel.topAnchor.constraint(equalTo: avatarImage.topAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
//            nameLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor),
//            nameLabel.bottomAnchor.constraint(equalTo: locationLabel.topAnchor),
            
            locationLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            locationLabel.bottomAnchor.constraint(equalTo: avatarImage.bottomAnchor)
        ])
    }
}
