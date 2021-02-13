//
//  Bounds.swift
//  FeedExplorer
//
//  Created by redpanda on 2021-02-13.
//

import Foundation

struct Bounds: Codable {
    var minLat: Double
    var maxLat: Double
    var minLon: Double
    var maxLon: Double
    
    enum CodingKeys: String, CodingKey {
        case minLat = "min_lat"
        case maxLat = "max_lat"
        case minLon = "min_lon"
        case maxLon = "max_lon"
    }
}
