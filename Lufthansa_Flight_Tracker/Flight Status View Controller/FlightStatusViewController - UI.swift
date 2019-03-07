//
//  FlightStatusViewController - UI.swift
//  Lufthansa_Flight_Tracker
//
//  Created by Andrew Santoso on 3/3/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

extension FlightStatusViewController {
    
    func setupNavBar() {
        let navController = navigationController!
        self.title = "Flight Status"
        navController.navigationBar.barTintColor = Constants.lufthansaNavy
        navController.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 22)!, .foregroundColor: UIColor.white]
    }
    
    func setupUI() {
        view.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        view.addSubview(flightNumberLabel)
        flightNumberLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        flightNumberLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        flightNumberLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10).isActive = true
        flightNumberLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(textField)
        textField.leadingAnchor.constraint(equalTo: flightNumberLabel.trailingAnchor, constant: 5).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        textField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(dateLabel)
        dateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        dateLabel.topAnchor.constraint(equalTo: flightNumberLabel.bottomAnchor, constant: 30).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(dateTextField)
        dateTextField.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 5).isActive = true
        dateTextField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        dateTextField.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30).isActive = true
        dateTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(checkFlightButton)
        checkFlightButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        checkFlightButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        checkFlightButton.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 30).isActive = true
        checkFlightButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }

}
