//
//  AirportInfoViewController - UI.swift
//  Lufthansa_Flight_Tracker
//
//  Created by Andrew Santoso on 3/3/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

extension AirportInfoViewController {
    
    func setupUI() {
        view.addSubview(map)
        map.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        map.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        map.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        map.heightAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.height / 3).isActive = true
        
        view.addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: map.bottomAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        containerView.addSubview(segmentedControl)
        segmentedControl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        segmentedControl.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        segmentedControl.widthAnchor.constraint(equalToConstant: 150)
        segmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setupNavBar() {
        self.navigationController?.navigationBar.tintColor = .white
        guard let code = self.airportAnnotation?.airport.airportCode else { return }
        self.title = code
    }
}
