//
//  PLEmptyStateView.swift
//  GitHubFollowers
//
//  Created by Paulo Lazarini on 06/08/24.
//

import UIKit

final class PLEmptyStateView: UIView {
    
    private lazy var messageLabel: PLTitleLabel = {
        let messageLabel = PLTitleLabel(textAlignment: .center, fontSize: 20)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        messageLabel.text = "User has no followers!"
        
        return messageLabel
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "empty-state-logo")
        
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String) {
        super.init(frame: .zero)
        messageLabel.text = message
        configure()
    }
    
    private func configure() {
        addSubview(logoImageView)
        addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant:  -150),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            
            logoImageView.heightAnchor.constraint(equalTo: widthAnchor, constant: 1.3),
            logoImageView.widthAnchor.constraint(equalTo: widthAnchor, constant: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 130),
            logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10)
        ])
    }
}
