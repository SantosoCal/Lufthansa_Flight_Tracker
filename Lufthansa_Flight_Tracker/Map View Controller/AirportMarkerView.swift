//
//  File.swift
//  Lufthansa_Flight_Tracker
//
//  Created by Andrew Santoso on 3/3/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import UIKit
import MapKit

class AirportMarkerView: MKMarkerAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            guard let airport = newValue as? AirportAnnotation else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            let detailLabel = UILabel()
            detailLabel.numberOfLines = 0
            detailLabel.font = detailLabel.font.withSize(12)
            detailLabel.text = airport.subtitle
            detailCalloutAccessoryView = detailLabel
            
        }
    }
    
}
