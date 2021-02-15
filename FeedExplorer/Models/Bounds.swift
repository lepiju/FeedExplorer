//
//  Bounds.swift
//  FeedExplorer
//
//  Created by redpanda on 2021-02-13.
//

import Foundation

struct Bounds: Codable {
    var minLatitude: Double
    var maxLatitude: Double
    var minLongitude: Double
    var maxLongitude: Double
    
    enum CodingKeys: String, CodingKey {
        case minLatitude = "min_lat"
        case maxLatitude = "max_lat"
        case minLongitude = "min_lon"
        case maxLongitude = "max_lon"
    }
}
