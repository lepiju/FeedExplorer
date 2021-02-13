//
//  Feed.swift
//  FeedExplorer
//
//  Created by redpanda on 2021-02-13.
//

import Foundation

//{"id":1,"code":"STM","timezone":"America/Montreal","bounds":{"min_lat":45.3081,"max_lat":45.7916,"min_lon":-74.0894,"max_lon":-73.3465},"bgtfs_hash":"5b3296350b420532e1db566d587d429e","bgtfs_feed_version":35074680,"bgtfs_uploaded_at":"2021-02-11T13:41:00Z","start_date":"2021-02-10","end_date":"2021-03-21","name":"STM","feed_network_name":null,"location":"Montréal","country_code":"CA"}

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
