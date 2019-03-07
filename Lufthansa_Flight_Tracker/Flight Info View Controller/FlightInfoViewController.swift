//
//  FlightInfoViewController.swift
//  Lufthansa_Flight_Tracker
//
//  Created by Andrew Santoso on 3/5/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import UIKit

class FlightInfoViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "SampleLufthansaPlane.jpg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var destContainerView: UIView = {
        let destContainerView = UIView()
        destContainerView.backgroundColor = Constants.lufthansaNavy
        destContainerView.layer.masksToBounds = true
        destContainerView.layer.cornerRadius = 5
        destContainerView.translatesAutoresizingMaskIntoConstraints = false
        return destContainerView
    }()
    
    lazy var departingLabel: UILabel = {
        let departingLabel = UILabel()
        departingLabel.textAlignment = .center
        departingLabel.textColor = .white
        departingLabel.font = UIFont.appleSDGothicNeo.bold.font(size: 22)
        departingLabel.translatesAutoresizingMaskIntoConstraints = false
        return departingLabel
    }()
    
    lazy var arrowIcon: UIImageView = {
        let arrowIcon = UIImageView()
        arrowIcon.image = UIImage(named: "whiteArrow.png")
        arrowIcon.contentMode = .scaleAspectFit
        arrowIcon.translatesAutoresizingMaskIntoConstraints = false
        return arrowIcon
    }()
    
    lazy var arrivingLabel: UILabel = {
        let arrivingLabel = UILabel()
        arrivingLabel.textAlignment = .center
        arrivingLabel.textColor = .white
        arrivingLabel.font = UIFont.appleSDGothicNeo.bold.font(size: 22)
        arrivingLabel.translatesAutoresizingMaskIntoConstraints = false
        return arrivingLabel
    }()
    
    lazy var infoContainerView: UIView = {
        let infoContainerView = UIView()
        infoContainerView.backgroundColor = .white
        infoContainerView.layer.masksToBounds = true
        infoContainerView.layer.cornerRadius = 10
        infoContainerView.layer.borderWidth = 1
        infoContainerView.layer.borderColor = Constants.lufthansaNavy.cgColor
        infoContainerView.translatesAutoresizingMaskIntoConstraints = false
        return infoContainerView
    }()
    
    lazy var flightInfoLabel: UILabel = {
        let flightInfoLabel = UILabel()
        flightInfoLabel.textAlignment = .left
        flightInfoLabel.textColor = .white
        flightInfoLabel.text = "    Flight Information"
        flightInfoLabel.font = UIFont.appleSDGothicNeo.regular.font(size: 18)
        flightInfoLabel.backgroundColor = Constants.lufthansaNavy
        flightInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        return flightInfoLabel
    }()
    
    lazy var flightStatusLabel: UILabel = {
        let flightStatusLabel = UILabel()
        flightStatusLabel.textAlignment = .left
        flightStatusLabel.textColor = Constants.darkerGray
        flightStatusLabel.font = UIFont.appleSDGothicNeo.regular.font(size: 16)
        flightStatusLabel.backgroundColor = .white
        flightStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        return flightStatusLabel
    }()
    
    lazy var scheduledDepartureLabel: UILabel = {
        let scheduledDepartureLabel = UILabel()
        scheduledDepartureLabel.textAlignment = .left
        scheduledDepartureLabel.textColor = Constants.darkerGray
        scheduledDepartureLabel.font = UIFont.appleSDGothicNeo.regular.font(size: 16)
        scheduledDepartureLabel.backgroundColor = .white
        scheduledDepartureLabel.translatesAutoresizingMaskIntoConstraints = false
        return scheduledDepartureLabel
    }()
    
    lazy var actualDepartureLabel: UILabel = {
        let actualDepartureLabel = UILabel()
        actualDepartureLabel.textAlignment = .left
        actualDepartureLabel.textColor = Constants.darkerGray
        actualDepartureLabel.font = UIFont.appleSDGothicNeo.regular.font(size: 16)
        actualDepartureLabel.backgroundColor = .white
        actualDepartureLabel.translatesAutoresizingMaskIntoConstraints = false
        return actualDepartureLabel
    }()
    
    lazy var scheduledArrivalLabel: UILabel = {
        let scheduledArrivalLabel = UILabel()
        scheduledArrivalLabel.textAlignment = .left
        scheduledArrivalLabel.textColor = Constants.darkerGray
        scheduledArrivalLabel.font = UIFont.appleSDGothicNeo.regular.font(size: 16)
        scheduledArrivalLabel.backgroundColor = .white
        scheduledArrivalLabel.translatesAutoresizingMaskIntoConstraints = false
        return scheduledArrivalLabel
    }()
    
    lazy var actualArrivalLabel: UILabel = {
        let actualArrivalLabel = UILabel()
        actualArrivalLabel.textAlignment = .left
        actualArrivalLabel.textColor = Constants.darkerGray
        actualArrivalLabel.font = UIFont.appleSDGothicNeo.regular.font(size: 16)
        actualArrivalLabel.backgroundColor = .white
        actualArrivalLabel.translatesAutoresizingMaskIntoConstraints = false
        return actualArrivalLabel
    }()
    
    lazy var aircraftLabel: UILabel = {
        let aircraftLabel = UILabel()
        aircraftLabel.textAlignment = .left
        aircraftLabel.textColor = Constants.darkerGray
        aircraftLabel.font = UIFont.appleSDGothicNeo.regular.font(size: 16)
        aircraftLabel.text = "   Aircraft:"
        aircraftLabel.backgroundColor = .white
        aircraftLabel.translatesAutoresizingMaskIntoConstraints = false
        return aircraftLabel
    }()
    
    var flight: Flight? {
        didSet {
            if let fl = flight {
                departingLabel.text = fl.departingFrom
                arrivingLabel.text = fl.arrivingAt
                flightStatusLabel.text = "    Flight Status: \(fl.timeStatus)"
                scheduledDepartureLabel.text = "    Scheduled Departure: \(fl.scheduledDepartureTime)"
                actualDepartureLabel.text = "    Actual Departure: \(fl.actualDepartureTime)"
                scheduledArrivalLabel.text = "    Scheduled Arrival: \(fl.scheduledArrivalTime)"
                actualArrivalLabel.text = "    Actual Arrival: \(fl.actualArrivalTime)"
            }
        }
    }
    
    var flightNumber: String? {
        didSet {
            if let flNum = flightNumber {
                title = "\(flNum)"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupNavBar()
    }
    
    @objc func addTapped() {
        guard let f = flight else { return }
        favorites.append(f)
    }

}
