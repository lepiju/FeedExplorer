//
//  Map.swift
//  FeedExplorer
//
//  Created by redpanda on 2021-02-13.
//

import Foundation

struct Map: Codable {
    let feeds: Array<Feed>
    
    enum CodingKeys: String, CodingKey {
        case feeds    }
}
