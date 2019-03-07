//
//  AirportAnnotation.swift
//  Lufthansa_Flight_Tracker
//
//  Created by Andrew Santoso on 3/3/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import UIKit
import MapKit

class AirportAnnotation: NSObject, MKAnnotation {
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    let airport: Airport
    
    init(airport: Airport) {
        self.title = airport.airportCode
        self.coordinate = airport.coordinate
        self.airport = airport
        super.init()
    }
    
    var subtitle: String? {
        guard let title = self.title else { return "" }
        return "\(title)"
    }
}
