//
//  NetworkManager.swift
//  FeedExplorer
//
//  Created by redpanda on 2021-02-13.
//

import Foundation

let sharedNetworkManager = NetworkManager()

class NetworkManager {
    private let feedUrl = "https://api.transitapp.com/v3/feeds?detailed=1"
    
    func fetchMap(completionHandler: @escaping (Map) -> Void) {
        let url = URL(string: feedUrl)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

            if let data = data,
               let map = try? JSONDecoder().decode(Map.self, from: data) {
                completionHandler(map.self)
            }
        })
        task.resume()
    }
}
