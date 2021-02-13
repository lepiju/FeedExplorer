//
//  Feed.swift
//  FeedExplorer
//
//  Created by redpanda on 2021-02-13.
//

import Foundation
import MapKit

struct Feed: Codable {
    let id: Int
    let code: String
    let timezone: String
    let bounds: Bounds
    let bgtfsHash: String
    let bgtfsFeedVersion: Double
    let bgtfsUploadedAt: String
    let startDate: String
    let endDate: String
    let name: String
    let feedNetworkName: String?
    let location: String
    let countryCode: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case code
        case timezone
        case bounds
        case bgtfsHash = "bgtfs_hash"
        case bgtfsFeedVersion = "bgtfs_feed_version"
        case bgtfsUploadedAt = "bgtfs_uploaded_at"
        case startDate = "start_date"
        case endDate = "end_date"
        case name
        case feedNetworkName = "feed_network_name"
        case location
        case countryCode = "country_code"
    }
}
