//
//  PLRepoItemViewController.swift
//  GitHubFollowers
//
//  Created by Paulo Lazarini on 08/08/24.
//

import UIKit

final class PLRepoItemViewController: UIViewController {
    
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
        let button = PLButton(backgroundColor: .systemPurple, title: "GitHub Profile")
        
        return button
    }()
    
    private var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
        
        configurePrimaryItemView(sfSymbolName: "folder", title: "Public Repost", counter: user.publicRepos)
        configureSecondaryItemView(sfSymbolName: "text.justify.left", title: "Public Gists", counter: user.publicGists)
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

#Preview {
    PLRepoItemViewController(user: .mock())
}
