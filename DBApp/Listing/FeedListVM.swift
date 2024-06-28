//
//  FeedListVM.swift
//  DBApp
//
//  Created by Boariu Andy on 28.06.2024.
//

import Foundation

protocol FeedProtocol: AnyObject {
    func receivedFeeds()
}

final class FeedListVM {
    var service: FeedService
    var arrFeeds: [Feed] = []
    var error: Error?
    weak var delegate: FeedProtocol?

    init(service: FeedService) {
        self.service = service
    }

    func fetchPosts() {
        service.fetchFeeds { posts, error in
            self.arrFeeds = posts
            self.delegate?.receivedFeeds()
        }
    }
}
