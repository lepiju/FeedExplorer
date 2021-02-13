//
//  Feed.swift
//  FeedExplorer
//
//  Created by redpanda on 2021-02-13.
//

import Foundation
import MapKit

class Feed: NSObject, MKAnnotation, Decodable{
    let name: String?
    let location: String?
    let countryCode: String?
    let coordinate: CLLocationCoordinate2D
    private let bounds: Bounds
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.bounds = (try? container.decode(Bounds.self, forKey: .bounds)) ??
            Bounds(minLat: 0, maxLat: 0, minLon: 0, maxLon: 0)
        self.name = try? container.decode(String.self, forKey: .name)
        self.location = try? container.decode(String.self, forKey: .location)
        self.countryCode = try? container.decode(String.self, forKey: .countryCode)
        
        let latitude = (bounds.maxLat + bounds.minLat) / 2
        let longitude = (bounds.maxLon + bounds.minLon) / 2
        
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    enum CodingKeys: String, CodingKey {
        case bounds
        case name
        case location
        case countryCode = "country_code"
    }
}

//struct Feed: Codable {
//    let id: Int
//    let code: String
//    let timezone: String
//    let bounds: Bounds
//    let bgtfsHash: String
//    let bgtfsFeedVersion: Double
//    let bgtfsUploadedAt: String
//    let startDate: String
//    let endDate: String
//    let name: String
//    let feedNetworkName: String?
//    let location: String
//    let countryCode: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case code
//        case timezone
//        case bounds
//        case bgtfsHash = "bgtfs_hash"
//        case bgtfsFeedVersion = "bgtfs_feed_version"
//        case bgtfsUploadedAt = "bgtfs_uploaded_at"
//        case startDate = "start_date"
//        case endDate = "end_date"
//        case name
//        case feedNetworkName = "feed_network_name"
//        case location
//        case countryCode = "country_code"
//    }
//}
