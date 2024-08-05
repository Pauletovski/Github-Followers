//
//  UIViewController+extensions.swift
//  GitHubFollowers
//
//  Created by Paulo Lazarini on 30/07/24.
//

import UIKit

extension UIViewController {
    func presentPLAlertOnMainThread(title: String, message: String, buttonTitle: String = "Ok") {
        DispatchQueue.main.async { [weak self] in
            let alertViewController = PLAlertViewController(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertViewController.modalPresentationStyle = .overFullScreen
            alertViewController.modalTransitionStyle = .crossDissolve
            
            self?.present(alertViewController, animated: true)
        }
    }
}
