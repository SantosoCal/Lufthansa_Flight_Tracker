//
//  FlightStatusViewController.swift
//  Lufthansa_Flight_Tracker
//
//  Created by Andrew Santoso on 3/3/19.
//  Copyright © 2019 Andrew Santoso. All rights reserved.
//

import UIKit

var favorites = [Flight]()

class FlightStatusViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "LufthansaNavy.png")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Flight"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var flightNumberLabel: UILabel = {
        let flightNumberLabel = UILabel()
        flightNumberLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        flightNumberLabel.textAlignment = .center
        flightNumberLabel.text = "Flight Number: "
        flightNumberLabel.textColor = Constants.lufthansaNavy
        flightNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        return flightNumberLabel
    }()
    
    lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        dateLabel.textAlignment = .center
        dateLabel.text = "Date: "
        dateLabel.textColor = Constants.lufthansaNavy
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    lazy var dateTextField: UITextField = {
        let dateTextField = UITextField()
        dateTextField.placeholder = "Pick a date"
        dateTextField.font = UIFont.systemFont(ofSize: 15)
        dateTextField.borderStyle = UITextField.BorderStyle.roundedRect
        dateTextField.inputView = datePicker
        dateTextField.delegate = self
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        return dateTextField
    }()
    
    lazy var checkFlightButton: UIButton = {
        let frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        let checkFlightButton = UIButton(frame: frame)
        checkFlightButton.backgroundColor = Constants.lufthansaNavy
        checkFlightButton.setTitle("Check Flight", for: .normal)
        checkFlightButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        checkFlightButton.titleLabel?.textColor = .white
        checkFlightButton.addTarget(self, action: #selector(checkFlightButtonClicked), for: .touchUpInside)
        checkFlightButton.layer.masksToBounds = true
        checkFlightButton.layer.cornerRadius = 8
        checkFlightButton.isUserInteractionEnabled = true
        checkFlightButton.addTarget(self, action: #selector(checkFlightTapped), for: .touchUpInside)
        checkFlightButton.translatesAutoresizingMaskIntoConstraints = false
        return checkFlightButton
    }()
    
    var flightToPass: Flight?
    var flightNumToPass: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupNavBar()
    }
    
    //gets rid of editing when tap outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @objc func checkFlightTapped() {
        guard let flightNumber = textField.text else { return }
        guard let datePicked = dateTextField.text else { return }
        if flightNumber == "" || datePicked == "" {
            displayAlert(title: "Missing Information", message: "Please enter flight number and date.")
            return
        }
        if flightNumber.count != 5 {
            displayAlert(title: "Invalid Flight Number", message: "Flight Number must be 5 characters.")
            return
        }
        self.flightNumToPass = flightNumber
        LufthansaAPIClient.getAuthToken() {
            LufthansaAPIClient.getFlightStatus(flightNum: flightNumber, date: datePicked) { flight in
                self.flightToPass = flight
                self.performSegue(withIdentifier: "showFlightStatus", sender: self)
            }
        }
    }
    
    func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "okay", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let selectedDate: String = dateFormatter.string(from: sender.date)
        dateTextField.text = selectedDate
        print("Selected value \(selectedDate)")
    }
    
    @objc func checkFlightButtonClicked() {
        print("button clicked")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFlightStatus" {
            guard let flightVC = segue.destination as? FlightInfoViewController else { return }
            guard let flight = self.flightToPass else { return }
            guard let flightNum = self.flightNumToPass else { return }
            flightVC.flight = flight
            flightVC.flightNumber = flightNum
            self.flightNumToPass = nil
            self.flightToPass = nil
        }
    }

}

extension FlightStatusViewController: UITextFieldDelegate {
}
