//
//  MapPageViewController.swift
//  Lufthansa_Flight_Tracker
//
//  Created by Andrew Santoso on 3/3/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    lazy var map: MKMapView = {
        let frame = CGRect(x: 0, y: 0, width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.height)
        let map = MKMapView(frame: frame)
        map.delegate = self
        map.translatesAutoresizingMaskIntoConstraints = false
        map.register(AirportMarkerView.self,forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        return map
    }()
    
    var manager = CLLocationManager()
    
    var airports: [Airport]? {
        didSet {
            if let allAirports = airports {
                manager.startUpdatingLocation()
            }
        }
    }
    
    var airportAnnotationHolder: AirportAnnotation?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupUI()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        LufthansaAPIClient.getAuthToken() {
            LufthansaAPIClient.getAirports(completion: { (airports) in
                self.airports = airports
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAirport" {
            guard let airportVC = segue.destination as? AirportInfoViewController else { return }
            guard let airportAnnotation = self.airportAnnotationHolder else { return }
            airportVC.airportAnnotation = airportAnnotation
            self.airportAnnotationHolder = nil
        }
    }
    
}

extension MapViewController {
    
    func setupUI() {
        view.addSubview(map)
        map.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        map.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        map.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setupNavBar() {
        let navController = navigationController!
        self.title = "Airports"
        navController.navigationBar.barTintColor = Constants.lufthansaNavy
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 22)!, .foregroundColor: UIColor.white]
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let selectedAnnotation = view.annotation as? AirportAnnotation {
            airportAnnotationHolder = selectedAnnotation
            performSegue(withIdentifier: "showAirport", sender: self)
        }
    }
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Center Coordinate for Europe
        let centerLoc: CLLocationCoordinate2D = CLLocationCoordinate2DMake(54, 15)
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 50.0, longitudeDelta: 50.0)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: centerLoc, span: span)
        map.setRegion(region, animated: true)
        map.showsUserLocation = true
        
        // Temporary
        var annotations = [AirportAnnotation]()
        if let airports = self.airports {
            for i in 0..<airports.count {
                annotations.append(AirportAnnotation(airport: airports[i]))
            }
            map.addAnnotations(annotations)
        }
        manager.stopUpdatingLocation()
    }
}

