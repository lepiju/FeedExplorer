//
//  Map.swift
//  FeedExplorer
//
//  Created by redpanda on 2021-02-13.
//

import Foundation

struct Map: Codable {
    var feeds: Array<Feed> { get set }
}
