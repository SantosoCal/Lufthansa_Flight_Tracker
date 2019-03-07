//
//  FlightCell.swift
//  Lufthansa_Flight_Tracker
//
//  Created by Andrew Santoso on 3/3/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

class FlightCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .left
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.masksToBounds = true
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = Constants.lufthansaNavy.cgColor
        containerView.layer.cornerRadius = 8
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    lazy var destinationLabel: UILabel = {
        let destinationLabel = UILabel()
        destinationLabel.backgroundColor = Constants.lufthansaNavy
        destinationLabel.textColor = .white
        destinationLabel.textAlignment = .left
        destinationLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        destinationLabel.translatesAutoresizingMaskIntoConstraints = false
        return destinationLabel
    }()
    
    lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.backgroundColor = .white
        timeLabel.textColor = Constants.lufthansaNavy
        timeLabel.textAlignment = .left
        timeLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        return timeLabel
    }()
    
    lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.backgroundColor = .white
        statusLabel.textColor = Constants.lufthansaNavy
        statusLabel.textAlignment = .left
        statusLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    var flight: Flight? {
        didSet {
            guard let fl = flight else { return }
            if departing {
                destinationLabel.text = "    To \(fl.arrivingAt)"
                timeLabel.text = "    Departing at \(fl.actualDepartureTime)"
            } else {
                destinationLabel.text = "    From \(fl.departingFrom)"
                timeLabel.text = "    Arriving at \(fl.actualArrivalTime)"
            }
            statusLabel.text = "    \(fl.timeStatus)"
        }
    }
    
    var departing: Bool = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
