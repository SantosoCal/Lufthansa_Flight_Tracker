//
//  Flight.swift
//  LufthansaMP4Skeleton
//
//  Created by Max Miranda on 3/2/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import SwiftyJSON

class Flight {
    
    var timeStatus: String
    var departingFrom: String
    var arrivingAt: String
    var scheduledDepartureTime: String
    var actualDepartureTime: String
    var scheduledArrivalTime: String
    var actualArrivalTime: String
    var aircraftCode: String

    init(data: JSON) {
        self.timeStatus = data["FlightStatus"]["Definition"].stringValue
        self.departingFrom = data["Departure"]["AirportCode"].stringValue
        self.arrivingAt = data["Arrival"]["AirportCode"].stringValue
        self.scheduledDepartureTime = data["Departure"]["ScheduledTimeUTC"]["DateTime"].stringValue
        self.actualDepartureTime = data["Departure"]["ActualTimeUTC"]["DateTime"].stringValue
        self.scheduledArrivalTime = data["Arrival"]["ScheduledTimeUTC"]["DateTime"].stringValue
        self.actualArrivalTime = data["Arrival"]["ActualTimeUTC"]["DateTime"].stringValue
        self.aircraftCode = ""
    }
    
    func printAllInfo() {
        print("timeStatus: \(self.timeStatus) \n departingFrom: \(self.departingFrom) \n arrivingAt: \(self.arrivingAt) \n scheduledDepartureTime: \(self.scheduledDepartureTime) \n actualDepartureTime: \(self.actualDepartureTime) \n scheduledArrivalTime: \(self.scheduledArrivalTime) \n actualArrivalTime: \(self.actualArrivalTime)")
    }
    
}
