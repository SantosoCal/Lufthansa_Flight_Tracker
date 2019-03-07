//
//  Constants.swift
//  Lufthansa_Flight_Tracker
//
//  Created by Andrew Santoso on 3/3/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    
    //static let lufthansaOrange = UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1)
    static let darkerGray = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1)
    static let lufthansaNavy = UIColor(red: 0/255, green: 0/255, blue: 100/255, alpha: 1)
    static let lightBlue: UIColor = UIColor(red: 66/255, green: 176/255, blue: 244/255, alpha: 1)
    static let correctGreen: UIColor = UIColor(red: 8/255, green: 241/255, blue: 54/255, alpha: 1)
    static let wrongRed: UIColor = UIColor(red: 244/255, green: 0, blue: 0, alpha: 1)
    static let mdbYellow: UIColor = UIColor(red: 254/255, green: 232/255, blue: 43/255, alpha: 1)
    static let coolGreen: UIColor = UIColor(red: 119/255, green: 211/255, blue: 83/255, alpha: 1)
    
    static func getCurrentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        return formatter.string(from: date)
    }
}
