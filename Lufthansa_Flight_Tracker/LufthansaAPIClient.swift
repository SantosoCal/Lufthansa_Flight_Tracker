//
//  LufthansaAPIClient.swift
//  LufthansaMP4Skeleton
//
//  Created by Max Miranda on 3/2/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LufthansaAPIClient {
    
    static let clientSecret = "5DYFv7nGE8" //FIXME
    static let clientID = "zka68tgjcbbrsvm7zaxpq7uu" //FIXME
    
    static var authToken: String?
    
    static func getAuthToken(completion: @escaping () -> ()){
        
        let requestURL = "https://api.lufthansa.com/v1/oauth/token" //FIXME
        let parameters = ["client_id":"\(clientID)", "client_secret":"\(clientSecret)", "grant_type": "client_credentials"]
        
        Alamofire.request(requestURL, method:.post, parameters: parameters, encoding: URLEncoding()).responseJSON { response in
            
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
         
            let json = JSON(response.result.value!)
            self.authToken = json["access_token"].stringValue
            
            print("Auth token: " + self.authToken!)
            print("This key expires in " + json["expires_in"].stringValue + " seconds\n")
            
             completion()
         }
    }
    
    //This function will get the status for a flight. FlightNum format "LHXXX" Date format "YYYY-MM-DD"
    static func getFlightStatus(flightNum: String, date: String, completion: @escaping (Flight) -> ()){
        
        let requestURL = "https://api.lufthansa.com/v1/operations/flightstatus/\(flightNum)/\(date)" //FIXME
        let parameters: HTTPHeaders = ["Accept": "application/json", "Authorization": "Bearer \(self.authToken!)"]
        
        Alamofire.request(requestURL, headers: parameters).responseJSON { response in
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
            let json = JSON(response.result.value)
            print(json)
            let flight = Flight(data: json["FlightStatusResource"]["Flights"]["Flight"])
            completion(flight)
         }
    }
    
    static func getAirports(completion: @escaping ([Airport]) -> ()){
        
//        var airportsArray = [Airport]()
//        for i in [0, 100, 200] {
//            let requestURL = "https://api.lufthansa.com/v1/references/airports/?limit=100&offset=\(i)&LHoperated=1"
//            let parameters: HTTPHeaders = ["Accept": "application/json", "Authorization": "Bearer \(self.authToken!)"]
//
//            Alamofire.request(requestURL, headers: parameters).responseJSON { response in
//                guard response.result.isSuccess else {
//                    print(response.result.error.debugDescription)
//                    return
//                }
//                let json = JSON(response.result.value)
//                print(json)
//                if let airports = json["AirportResource"]["Airports"]["Airport"].array {
//                    for airport in airports {
//                        let tempAirport = Airport(data: airport)
//                        //tempAirport.printAllInfo()
//                        airportsArray.append(tempAirport)
//                    }
//                }
//            }
//        }
//        print("airportsArray.count: \(airportsArray.count)")
//        completion(airportsArray)

        let requestURL = "https://api.lufthansa.com/v1/references/airports/?limit=100&offset=0&LHoperated=1"
        let parameters: HTTPHeaders = ["Accept": "application/json", "Authorization": "Bearer \(self.authToken!)"]
        
        Alamofire.request(requestURL, headers: parameters).responseJSON { response in
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
            let json = JSON(response.result.value)
            print(json)
            var airportsArray = [Airport]()
            if let airports = json["AirportResource"]["Airports"]["Airport"].array {
                for airport in airports {
                    let tempAirport = Airport(data: airport)
                    //tempAirport.printAllInfo()
                    airportsArray.append(tempAirport)
                }
            }
            completion(airportsArray)
        }
    }
    
    // Format: airport - 3 letter airport code (LAX); currDate - YYYY-MM-DDTHH:mm
    static func getArrivalFlights(airport: String, completion: @escaping ([Flight]) -> ()) {
        let currDate = Constants.getCurrentDate()
        let requestURL = "https://api.lufthansa.com/v1/operations/flightstatus/arrivals/\(airport)/\(currDate)"
        let parameters: HTTPHeaders = ["Accept": "application/json", "Authorization": "Bearer \(self.authToken!)"]
        
        print ("requestURL: \(requestURL)")
        
        
        Alamofire.request(requestURL, headers: parameters).responseJSON { response in
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
            let json = JSON(response.result.value)
            print(json)
            var flightsArray = [Flight]()
            if let flights = json["FlightStatusResource"]["Flights"]["Flight"].array {
                for flight in flights {
                    let tempFlight = Flight(data: flight)
                    tempFlight.printAllInfo()
                    flightsArray.append(tempFlight)
                }
            }
            
            completion(flightsArray)
        }
    }
    
    // Format: airport - 3 letter airport code (LAX); currDate - YYYY-MM-DDTHH:mm
    static func getDepartingFlights(airport: String, completion: @escaping ([Flight]) -> ()) {
        let currDate = Constants.getCurrentDate()
        let requestURL = "https://api.lufthansa.com/v1/operations/flightstatus/departures/\(airport)/\(currDate)"
        let parameters: HTTPHeaders = ["Accept": "application/json", "Authorization": "Bearer \(self.authToken!)"]
        
        print ("requestURL: \(requestURL)")
        
        
        Alamofire.request(requestURL, headers: parameters).responseJSON { response in
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
            let json = JSON(response.result.value)
            print(json)
            var flightsArray = [Flight]()
            if let flights = json["FlightStatusResource"]["Flights"]["Flight"].array {
                for flight in flights {
                    let tempFlight = Flight(data: flight)
                    tempFlight.printAllInfo()
                    flightsArray.append(tempFlight)
                }
            }
            
            completion(flightsArray)
        }
    }
}
