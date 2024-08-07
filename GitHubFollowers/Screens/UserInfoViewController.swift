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
    
    private lazy var userRepo: PLUserInfoContainerViewController = {
        let viewController = PLUserInfoContainerViewController()
        
        return viewController
    }()
    
    private lazy var userFollowers: PLUserInfoContainerViewController = {
        let viewController = PLUserInfoContainerViewController()
        
        return viewController
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 24
        
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissViewController))
        navigationItem.rightBarButtonItem = doneButton
        
        getUserInfo(username: username)
    }
    
    func configure() {
        guard let user else { return }
        
        userHeader.setupData(using: user)
        
        userRepo.configurePrimaryItemView(sfSymbolName: "folder", title: "Public Repost", counter: user.publicRepos)
        userRepo.configureSecondaryItemView(sfSymbolName: "text.justify.left", title: "Public Gists", counter: user.publicGists)
        
        userFollowers.configurePrimaryItemView(sfSymbolName: "heart", title: "Following", counter: user.following)
        userFollowers.configureSecondaryItemView(sfSymbolName: "person.2", title: "Followers", counter: user.followers)
        userFollowers.configureButton(backgroundColor: .systemGreen, title: "Get Followers")
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(userHeader)
        stackView.addArrangedSubview(userRepo.view)
        stackView.addArrangedSubview(userFollowers.view)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        ])
    }
    
    func getUserInfo(username: String) {
        showLoadingView()
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            self?.dismissLoadingView()
            guard let self else { return }
            
            switch result {
            case .success(let user):
                self.user = user
                DispatchQueue.main.async { self.configure() }
            case .failure(let error):
                self.presentPLAlertOnMainThread(title: "ERROR!", message: error.rawValue)
            }
        }
    }
        
    @objc func dismissViewController() {
        dismiss(animated: true)
    }
}
