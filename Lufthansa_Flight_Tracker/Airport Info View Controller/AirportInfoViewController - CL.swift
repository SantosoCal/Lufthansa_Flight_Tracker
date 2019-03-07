//
//  AirportInfoViewController - CL.swift
//  Lufthansa_Flight_Tracker
//
//  Created by Andrew Santoso on 3/5/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
import MapKit

extension AirportInfoViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let airportLoc = self.airportAnnotation else { return }
        print("airportLoc.coordinate: \(airportLoc.coordinate)")
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: airportLoc.coordinate, span: span)
        map.setRegion(region, animated: true)
        map.showsUserLocation = true
        map.addAnnotation(airportLoc)
        manager.stopUpdatingLocation()
    }
}
