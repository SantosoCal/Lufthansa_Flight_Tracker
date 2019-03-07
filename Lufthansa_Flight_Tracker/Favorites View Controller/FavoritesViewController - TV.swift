//
//  FavoritesViewController - TV.swift
//  Lufthansa_Flight_Tracker
//
//  Created by Andrew Santoso on 3/5/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flightCell") as! FlightCell
        cell.flight = favorites[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
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
