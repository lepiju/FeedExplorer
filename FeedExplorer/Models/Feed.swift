//
//  Feed.swift
//  FeedExplorer
//
//  Created by redpanda on 2021-02-13.
//

import MapKit
import UIKit

class Feed: NSObject, MKAnnotation, Decodable{
    let title: String?
    let subtitle: String?
    let countryCode: String?
    let coordinate: CLLocationCoordinate2D
    private let bounds: Bounds
    
    var pinColor: UIColor {
        switch countryCode {
        case "CA":
            return UIColor.CountryColor.Canada
        case "US":
            return UIColor.CountryColor.UnitedStates
        case "FR":
            return UIColor.CountryColor.France
        case "UK":
            return UIColor.CountryColor.UnitedKingdom
        case "GB":
            return UIColor.CountryColor.UnitedKingdom
        case "DE":
            return UIColor.CountryColor.Germany
        default:
            return UIColor.CountryColor.Other
        }
    }
    
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.bounds = (try? container.decode(Bounds.self, forKey: .bounds)) ??
            Bounds(minLatitude: 0, maxLatitude: 0, minLongitude: 0, maxLongitude: 0)
        self.title = try? container.decode(String.self, forKey: .title)
        self.subtitle = try? container.decode(String.self, forKey: .subtitle)
        
        let countryCode = (try? container.decode(String.self, forKey: .countryCode)) ?? ""
        
        self.countryCode = countryCode
        
        let latitude = (bounds.maxLatitude + bounds.minLatitude) / 2
        let longitude = (bounds.maxLongitude + bounds.minLongitude) / 2
                
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    enum CodingKeys: String, CodingKey {
        case bounds
        case title = "name"
        case subtitle = "location"
        case countryCode = "country_code"
    }
}
