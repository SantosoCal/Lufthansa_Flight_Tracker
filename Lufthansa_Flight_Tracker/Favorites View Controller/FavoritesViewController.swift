//
//  FavoritesViewController.swift
//  Lufthansa_Flight_Tracker
//
//  Created by Andrew Santoso on 3/5/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
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
    
    var flightToPass: Flight? {
        didSet {
            if let fl = flightToPass {
                performSegue(withIdentifier: "showFlightFav", sender: self)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("Favorites.count: \(favorites.count)")
        favorites = favorites.sorted(by: {
            $0.actualArrivalTime.compare($1.actualArrivalTime) == .orderedDescending
        })
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFlightFav" {
            guard let flightVC = segue.destination as? FlightInfoViewController else { return }
            guard let flight = self.flightToPass else { return }
            flightVC.flight = flight
            self.flightToPass = nil
        }
    }
}
