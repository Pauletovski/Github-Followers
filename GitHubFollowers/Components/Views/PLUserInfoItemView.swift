//
//  PLUserInfoItemView.swift
//  GitHubFollowers
//
//  Created by Paulo Lazarini on 06/08/24.
//

import UIKit

final class PLUserInfoItemView: UIView {
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .secondaryLabel
        
        return image
    }()
    
    private lazy var titleLabel: PLBodyLabel = {
        let label = PLBodyLabel(textAlignment: .left)
        label.numberOfLines = 1
        
        return label
    }()
    
    
    private lazy var counterLabel: PLBodyLabel = {
        let label = PLBodyLabel(textAlignment: .center)
        label.numberOfLines = 1
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(sfSymbolName: String, title: String, counter: Int) {
        imageView.image = UIImage(systemName: sfSymbolName)
        titleLabel.text = title
        counterLabel.text = "\(counter)"
    }
    
    private func configureView() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(counterLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 24),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 20),
            
            counterLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            counterLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
