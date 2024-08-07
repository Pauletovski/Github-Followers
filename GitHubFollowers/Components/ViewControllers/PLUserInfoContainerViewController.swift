//
//  PLUserInfoContainerViewController.swift
//  GitHubFollowers
//
//  Created by Paulo Lazarini on 06/08/24.
//

import UIKit

final class PLUserInfoContainerViewController: UIViewController {
    
    let publicReposView = PLUserInfoItemView()
    let publicGistView = PLUserInfoItemView()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 16
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(publicReposView)
        stackView.addArrangedSubview(publicGistView)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            view.heightAnchor.constraint(greaterThanOrEqualToConstant: 150)
        ])
    }
    
    func configureButton(backgroundColor: UIColor, title: String) {
        button.backgroundColor = backgroundColor
        button.setTitle(title, for: .normal)
    }
    
    func configurePrimaryItemView(sfSymbolName: String, title: String, counter: Int) {
        publicReposView.configureData(sfSymbolName: sfSymbolName, title: title, counter: counter)
    }
    
    func configureSecondaryItemView(sfSymbolName: String, title: String, counter: Int) {
        publicGistView.configureData(sfSymbolName: sfSymbolName, title: title, counter: counter)
    }
}
