//
//  Feed.swift
//  DBApp
//
//  Created by Boariu Andy on 28.06.2024.
//

import Foundation

struct FeedResponse: Codable {
    let feeds: [Feed]
}

struct Feed: Codable {
    let userId: Int
    let id: Int
    let body: String
    let title: String
}
