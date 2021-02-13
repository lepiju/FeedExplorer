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
            
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            if let data = data,
               let map = try? JSONDecoder().decode(Map.self, from: data) {
                completionHandler(map.self)
            }
        })
        task.resume()
    }
}
