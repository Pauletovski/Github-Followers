//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by Paulo Lazarini on 01/08/24.
//

import Foundation

enum PLError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again!"
    case unableToComplete = "Unable to complete request!"
    case invalidResponse = "Invalid response from server!"
    case invalidData = "Could not retrieve data!"
    case decodingFailed = "Catch an error while decoding!"
}
