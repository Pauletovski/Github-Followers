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
    
    var convertToMonthYearFormat: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone.current
        
        if let date = dateFormatter.date(from: self) {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM yyyy"
            formatter.timeZone = TimeZone.current
            
            return formatter.string(from: date)
        }
        
        return nil
    }
}
