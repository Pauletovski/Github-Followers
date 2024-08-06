//
//  String+extensions.swift
//  GitHubFollowers
//
//  Created by Paulo Lazarini on 30/07/24.
//

import Foundation

extension Optional<String> {
    var isNotEmpty: Bool {
        guard let self else { return false }
        
        return !self.isEmpty
    }
}

extension String {
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}
