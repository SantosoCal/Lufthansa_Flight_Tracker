//
//  AirportInfoViewController - TV.swift
//  Lufthansa_Flight_Tracker
//
//  Created by Andrew Santoso on 3/3/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

extension AirportInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flightCell") as! FlightCell
        if segmentedControl.selectedSegmentIndex == 0 {
            cell.departing = true
            cell.flight = departingFlights?[indexPath.row]
        } else {
            cell.departing = false
            cell.flight = arrivingFlights?[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return departingFlights?.count ?? 0
        }
        return arrivingFlights?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FlightCell
        if let flight = cell.flight {
            self.flightToPass = flight
        }
    }

}
