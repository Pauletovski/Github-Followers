//
//  PLAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Paulo Lazarini on 01/08/24.
//

import UIKit

class PLAvatarImageView: UIImageView {
    
    lazy private var placeholderImage: UIImage = {
       let image = UIImage(named: "avatar-placeholder")
        
        return image!
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
    }
}
