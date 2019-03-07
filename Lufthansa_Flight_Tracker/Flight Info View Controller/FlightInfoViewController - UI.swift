//
//  FlightInfoViewController - UI.swift
//  Lufthansa_Flight_Tracker
//
//  Created by Andrew Santoso on 3/5/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

extension FlightInfoViewController {
    func setupUI() {
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(destContainerView)
        destContainerView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30).isActive = true
        destContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        destContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        destContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        destContainerView.addSubview(departingLabel)
        departingLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        departingLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
        departingLabel.centerYAnchor.constraint(equalTo: destContainerView.centerYAnchor).isActive = true
        departingLabel.leadingAnchor.constraint(equalTo: destContainerView.leadingAnchor, constant: 10).isActive = true
        
        destContainerView.addSubview(arrowIcon)
        arrowIcon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        arrowIcon.widthAnchor.constraint(equalToConstant: 75).isActive = true
        arrowIcon.centerYAnchor.constraint(equalTo: destContainerView.centerYAnchor).isActive = true
        arrowIcon.centerXAnchor.constraint(equalTo: destContainerView.centerXAnchor).isActive = true
        
        destContainerView.addSubview(arrivingLabel)
        arrivingLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        arrivingLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
        arrivingLabel.centerYAnchor.constraint(equalTo: destContainerView.centerYAnchor).isActive = true
        arrivingLabel.trailingAnchor.constraint(equalTo: destContainerView.trailingAnchor, constant: -10).isActive = true
        
        view.addSubview(infoContainerView)
        infoContainerView.topAnchor.constraint(equalTo: destContainerView.bottomAnchor, constant: 30).isActive = true
        infoContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        infoContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        infoContainerView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        infoContainerView.addSubview(flightInfoLabel)
        flightInfoLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        flightInfoLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor).isActive = true
        flightInfoLabel.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor).isActive = true
        flightInfoLabel.topAnchor.constraint(equalTo: infoContainerView.topAnchor).isActive = true
        
        infoContainerView.addSubview(flightStatusLabel)
        flightStatusLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        flightStatusLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor).isActive = true
        flightStatusLabel.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor).isActive = true
        flightStatusLabel.topAnchor.constraint(equalTo: flightInfoLabel.bottomAnchor, constant: 10).isActive = true
        
        let labelBuffer: CGFloat = 10
        
        infoContainerView.addSubview(scheduledDepartureLabel)
        scheduledDepartureLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        scheduledDepartureLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor).isActive = true
        scheduledDepartureLabel.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor).isActive = true
        scheduledDepartureLabel.topAnchor.constraint(equalTo: flightStatusLabel.bottomAnchor, constant: labelBuffer).isActive = true
        
        infoContainerView.addSubview(actualDepartureLabel)
        actualDepartureLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        actualDepartureLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor).isActive = true
        actualDepartureLabel.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor).isActive = true
        actualDepartureLabel.topAnchor.constraint(equalTo: scheduledDepartureLabel.bottomAnchor, constant: labelBuffer).isActive = true
        
        infoContainerView.addSubview(scheduledArrivalLabel)
        scheduledArrivalLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        scheduledArrivalLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor).isActive = true
        scheduledArrivalLabel.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor).isActive = true
        scheduledArrivalLabel.topAnchor.constraint(equalTo: actualDepartureLabel.bottomAnchor, constant: labelBuffer).isActive = true
        
        infoContainerView.addSubview(actualArrivalLabel)
        actualArrivalLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        actualArrivalLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor).isActive = true
        actualArrivalLabel.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor).isActive = true
        actualArrivalLabel.topAnchor.constraint(equalTo: scheduledArrivalLabel.bottomAnchor, constant: labelBuffer).isActive = true
        
        infoContainerView.addSubview(aircraftLabel)
        aircraftLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        aircraftLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor).isActive = true
        aircraftLabel.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor).isActive = true
        aircraftLabel.topAnchor.constraint(equalTo: actualArrivalLabel.bottomAnchor, constant: labelBuffer).isActive = true
    }
    
    func setupNavBar() {
        let navController = navigationController!
        navigationController?.navigationBar.tintColor = .white
        navController.navigationBar.barTintColor = Constants.lufthansaNavy
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont.appleSDGothicNeo.bold.font(size: 22), .foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
}
