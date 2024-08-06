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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissViewController))
        navigationItem.rightBarButtonItem = doneButton
        
        getUserInfo(username: username)
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
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }
}
