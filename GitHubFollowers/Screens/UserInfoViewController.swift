//
//  UserInfoViewController.swift
//  GitHubFollowers
//
//  Created by Paulo Lazarini on 06/08/24.
//

import UIKit

protocol ViewCode {
    func configureView()
    func layoutView()
    func setupDetails()
    func layoutConstraints()
}

extension ViewCode {
    func configureView() {
        layoutView()
        setupDetails()
        layoutConstraints()
    }
    
    func setupDetails() { }
}

final class UserInfoViewController: UIViewController {
    
    var username: String!
    var user: User!
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var itemViewOne: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var itemViewTwo: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var footerLabel: PLBodyLabel = {
        let label = PLBodyLabel(textAlignment: .center)
        
        return label
    }()
    
    var itemsView: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureView()
        getUserInfo(username: username)
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissViewController))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func getUserInfo(username: String) {
        showLoadingView()
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            self?.dismissLoadingView()
            guard let self else { return }
            
            switch result {
            case .success(let user):
                self.user = user
                DispatchQueue.main.async { self.configureUIElements(with: user) }
            case .failure(let error):
                self.presentPLAlertOnMainThread(title: "ERROR!", message: error.rawValue)
            }
        }
    }
    
    func configureUIElements(with user: User) {
        let repoItemVC = PLRepoItemViewController(user: user)
        let followerItemVC = PLFollowerItemViewController(user: user)
        
        self.add(childVC: repoItemVC, to: self.itemViewOne)
        self.add(childVC: followerItemVC, to: self.itemViewTwo)
        self.add(childVC: PLUserHeaderViewController(user: user), to: self.headerView)
        setupFooterLabel(using: user)
    }
    
    func setupFooterLabel(using data: User) {
        guard let date = data.createdAt.convertToMonthYearFormat else { return }
        footerLabel.text = "GitHub user since " + date
    }
        
    @objc func dismissViewController() {
        dismiss(animated: true)
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        NSLayoutConstraint.activate([
            childVC.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            childVC.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            childVC.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            childVC.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        childVC.didMove(toParent: self)
    }
}

extension UserInfoViewController: ViewCode {
    func layoutView() {
        view.addSubview(headerView)
        view.addSubview(itemViewOne)
        view.addSubview(itemViewTwo)
        view.addSubview(footerLabel)
    }
    
    func layoutConstraints() {
        let padding: CGFloat = 24
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            itemViewOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: 150),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            itemViewTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: 150),
            
            footerLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            footerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            footerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
    }
}
