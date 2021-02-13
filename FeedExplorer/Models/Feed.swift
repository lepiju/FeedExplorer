//
//  Feed.swift
//  FeedExplorer
//
//  Created by redpanda on 2021-02-13.
//

import Foundation
import MapKit

class Feed: NSObject, MKAnnotation, Decodable{
    let title: String?
    let subtitle: String?
    let countryCode: String?
    let coordinate: CLLocationCoordinate2D
    private let bounds: Bounds
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.bounds = (try? container.decode(Bounds.self, forKey: .bounds)) ??
            Bounds(minLat: 0, maxLat: 0, minLon: 0, maxLon: 0)
        self.title = try? container.decode(String.self, forKey: .title)
        self.subtitle = try? container.decode(String.self, forKey: .subtitle)
        self.countryCode = try? container.decode(String.self, forKey: .countryCode)
        
        let latitude = (bounds.maxLat + bounds.minLat) / 2
        let longitude = (bounds.maxLon + bounds.minLon) / 2
        
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    enum CodingKeys: String, CodingKey {
        case bounds
        case title = "name"
        case subtitle = "location"
        case countryCode = "country_code"
    }
}
