//
//  PLUserInfoContainerViewController.swift
//  GitHubFollowers
//
//  Created by Paulo Lazarini on 06/08/24.
//

import UIKit

final class PLFollowerItemViewController: UIViewController {
    
    let firstView = PLUserInfoItemView()
    let secondView = PLUserInfoItemView()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        
        return stack
    }()
    
    private lazy var button: PLButton = {
        let button = PLButton(backgroundColor: .systemGreen, title: "Get Followers")
        
        return button
    }()
    
    private var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
        
        configurePrimaryItemView(sfSymbolName: "heart", title: "Following", counter: user.following)
        configureSecondaryItemView(sfSymbolName: "person.2", title: "Followers", counter: user.followers)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 16
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(firstView)
        stackView.addArrangedSubview(secondView)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configurePrimaryItemView(sfSymbolName: String, title: String, counter: Int) {
        firstView.configureData(sfSymbolName: sfSymbolName, title: title, counter: counter)
    }
    
    func configureSecondaryItemView(sfSymbolName: String, title: String, counter: Int) {
        secondView.configureData(sfSymbolName: sfSymbolName, title: title, counter: counter)
    }
}
