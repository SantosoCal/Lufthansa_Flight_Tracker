//
//  AirportInfoViewController.swift
//  
//
//  Created by Andrew Santoso on 3/3/19.
//

import UIKit
import MapKit
import CoreLocation

class AirportInfoViewController: UIViewController {
    
    lazy var map: MKMapView = {
        let frame = CGRect(x: 0, y: 0, width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.height)
        let map = MKMapView(frame: frame)
        map.delegate = self
        map.translatesAutoresizingMaskIntoConstraints = false
        map.register(AirportMarkerView.self,forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        return map
    }()
    
    lazy var tableView: UITableView = {
        let frame = CGRect(x: 0, y: 0, width: self.view.safeAreaLayoutGuide.layoutFrame.width, height: (self.view.safeAreaLayoutGuide.layoutFrame.height / 3) * 2)
        let tableView = UITableView(frame: frame)
        tableView.register(FlightCell.self, forCellReuseIdentifier: "flightCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Departing", "Arriving"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
        segmentedControl.backgroundColor = .white
        segmentedControl.tintColor = Constants.lufthansaNavy
        let font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        segmentedControl.addTarget(self, action: #selector(controlSelected), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.layer.masksToBounds = true
        segmentedControl.layer.cornerRadius = 5
        segmentedControl.layer.borderColor = Constants.lufthansaNavy.cgColor
        segmentedControl.layer.borderWidth = 1
        return segmentedControl
    }()
    
    lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.masksToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    var manager = CLLocationManager()
    
    var airportAnnotation: AirportAnnotation?
    
    var departingFlights: [Flight]? {
        didSet {
            if let departingFls = departingFlights {
                tableView.reloadData()
                
            }
        }
    }
    var arrivingFlights: [Flight]? {
        didSet {
            if let arivingFLs = arrivingFlights {
                tableView.reloadData()
            }
        }
    }
        
    var flightToPass: Flight? {
        didSet {
            if let fl = flightToPass {
                performSegue(withIdentifier: "showFlight", sender: self)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        setupUI()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        
        if let code = airportAnnotation?.airport.airportCode {
            LufthansaAPIClient.getAuthToken() {
                LufthansaAPIClient.getArrivalFlights(airport: code, completion: { (flights) in
                    self.arrivingFlights = flights
                })
            }
        }
    }
    
    @objc func controlSelected(sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFlight" {
            guard let flightVC = segue.destination as? FlightInfoViewController else { return }
            guard let flight = self.flightToPass else { return }
            flightVC.flight = flight
            self.flightToPass = nil
        }
    }

}
