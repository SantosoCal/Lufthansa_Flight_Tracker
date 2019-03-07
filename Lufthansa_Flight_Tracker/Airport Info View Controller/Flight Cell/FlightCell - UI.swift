//
//  FlightCell - UI.swift
//  Lufthansa_Flight_Tracker
//
//  Created by Andrew Santoso on 3/3/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

extension FlightCell {
    
    func setupUI() {        
        contentView.addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        containerView.addSubview(destinationLabel)
        destinationLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        destinationLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        destinationLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        destinationLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        containerView.addSubview(timeLabel)
        timeLabel.topAnchor.constraint(equalTo: destinationLabel.bottomAnchor).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        containerView.addSubview(statusLabel)
        statusLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: -10).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
