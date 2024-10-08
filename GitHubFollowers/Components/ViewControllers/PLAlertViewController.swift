//
//  PLAlertViewController.swift
//  GitHubFollowers
//
//  Created by Paulo Lazarini on 30/07/24.
//

import UIKit

class PLAlertViewController: UIViewController {
        
    private lazy var containerView: PLAlertContainerView = {
        let container = PLAlertContainerView(frame: .zero)

        return container
    }()
    
    private lazy var titleLabel: PLTitleLabel = {
        let label = PLTitleLabel(textAlignment: .center, fontSize: 20)
        label.text = alertTitle ?? "ERROR!"
        
        return label
    }()
    
    private lazy var messageLabel: PLBodyLabel = {
        let label = PLBodyLabel(textAlignment: .center)
        label.text = message ?? "Unable to complete request"
        label.numberOfLines = 4
        
        return label
    }()
    
    private lazy var okButton: PLButton = {
        let button = PLButton(backgroundColor: .systemPink, title: buttonTitle ?? "Ok")
        button.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        
        return button
    }()
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    let padding: CGFloat = 20
    
    init(
        alertTitle: String,
        message: String,
        buttonTitle: String
    ) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    func configureContainerView() {
        view.addSubview(containerView)
    
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: padding)
        ])
    }
    
    func configureActionButton() {
        containerView.addSubview(okButton)
        
        NSLayoutConstraint.activate([
            okButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            okButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            okButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            okButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureMessageLabel() {
        containerView.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: okButton.topAnchor, constant: -12)
        ])
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }
}
