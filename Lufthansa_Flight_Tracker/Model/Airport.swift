//
//  Airport.swift
//  Lufthansa_Flight_Tracker
//
//  Created by Andrew Santoso on 3/3/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import SwiftyJSON

class Airport {
    
    var airportCode: String
    var coordinate: CLLocationCoordinate2D
    var name: String
    
    init(data: JSON) {
        self.airportCode = data["AirportCode"].stringValue
        let latitude = Double(data["Position"]["Coordinate"]["Latitude"].stringValue)
        let longitude = Double(data["Position"]["Coordinate"]["Longitude"].stringValue)
        if let lat = latitude, let long = longitude {
            self.coordinate = CLLocationCoordinate2DMake(lat, long)
        } else {
            self.coordinate = CLLocationCoordinate2DMake(0, 0)
        }
        self.name = "LAX"
    }
    
    func printAllInfo() {
        print("AirportCode: \(self.airportCode) \n Latitude: \(self.coordinate.latitude) \n Longitude: \(self.coordinate.longitude) \n")
    }
    
//    init(title: String, coordinate: CLLocationCoordinate2D) {
//        self.title = title
//        self.coordinate = coordinate
//    }
}
