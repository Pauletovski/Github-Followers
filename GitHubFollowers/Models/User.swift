//
//  User.swift
//  GitHubFollowers
//
//  Created by Paulo Lazarini on 31/07/24.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var followers: Int
    var following: Int
    var htmlUrl: String
    var createdAt: String
}

extension User {
    static func mock() -> User {
        User(
            login: "Pauletovski",
            avatarUrl: "https://avatars.githubusercontent.com/u/98775396?v=4",
            name: nil,
            location: nil,
            bio: nil,
            publicRepos: 4,
            publicGists: 0,
            followers: 2,
            following: 3,
            htmlUrl: "https://github.com/Pauletovski",
            createdAt: "2022-01-31T19:33:42Z"
        )
    }
}
