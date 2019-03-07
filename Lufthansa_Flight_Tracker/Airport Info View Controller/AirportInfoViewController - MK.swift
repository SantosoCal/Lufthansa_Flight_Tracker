//
//  AirportInfoViewController - MK.swift
//  Lufthansa_Flight_Tracker
//
//  Created by Andrew Santoso on 3/5/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension AirportInfoViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        //        if let selectedAnnotation = view.annotation as? AirportAnnotation {
        //            //self.pushDataDelegate?.finishPush(event: selectedAnnotation.event)
        //        }
    }
}
