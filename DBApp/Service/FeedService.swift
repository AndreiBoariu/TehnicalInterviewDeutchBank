//
//  FeedService.swift
//  DBApp
//
//  Created by Boariu Andy on 28.06.2024.
//

import Foundation

class FeedService {
    var urlSession = URLSession.shared


    func fetchFeeds<T:Decodable>(completion: @escaping(Result<T, Error>) -> Void) {
    }

    func fetchFeeds(completion: @escaping([Feed], Error?) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts?userId=1")!
        let urlRequest = URLRequest(url: url)
        urlSession.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                completion([], error)
                return
            }

            do {
                let decoder = JSONDecoder()
                let feedResponse = try decoder.decode([Feed].self, from: data)
                completion(feedResponse, nil)
            } catch {
                completion([], error)
            }
        }
        .resume()
    }
}
