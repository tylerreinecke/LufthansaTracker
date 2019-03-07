//
//  FlightRequestVC-UI.swift
//  LufthansaMP4Skeleton
//
//  Created by Tyler Reinecke on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import JGProgressHUD
import SkyFloatingLabelTextField
import Alamofire

extension FlightRequestVC {

    func initUI() {
        self.title = "Find a Flight"
        self.navigationController?.navigationBar.tintColor = Constants.jade
        self.navigationController?.isNavigationBarHidden = false
        
        flightNumInput = SkyFloatingLabelTextFieldWithIcon(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        flightNumInput.center = CGPoint(x: view.frame.midX, y: 200)
        //flightNumInput.placeholder = "Flight Number"
        flightNumInput.title = "Flight Number"
        flightNumInput.text = "LH"
        flightNumInput.tintColor = Constants.jade
        flightNumInput.iconColor = UIColor.lightGray
        //flightNumInput.iconFont = UIFont(name: "FontAwesome", size: 20.0)
        flightNumInput.lineHeight = 1.0
        flightNumInput.selectedLineHeight = 2.0
        flightNumInput.selectedIconColor = Constants.jade
        flightNumInput.selectedTitleColor = Constants.jade
        flightNumInput.selectedLineColor = Constants.jade
        flightNumInput.iconText = "#"
        view.addSubview(flightNumInput)
        
        dateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
        dateLabel.center = CGPoint(x: view.frame.midX, y: flightNumInput.frame.maxY + 42)
        dateLabel.textAlignment = .center
        dateLabel.text = "Flight Date:"
        dateLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        dateLabel.textColor = Constants.jade
        view.addSubview(dateLabel)
        
        datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        datePicker.center = CGPoint(x: view.frame.midX, y: dateLabel.frame.maxY + 85)
        datePicker.datePickerMode = .date
        view.addSubview(datePicker)
        
        requestButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        requestButton.center = CGPoint(x: view.frame.midX, y: datePicker.frame.maxY + 55)
        requestButton.setTitle("Search", for: .normal)
        requestButton.setTitleColor(Constants.jade, for: .normal)
        requestButton.backgroundColor = .white
        requestButton.layer.borderWidth = 3.0
        requestButton.layer.borderColor = Constants.jade.cgColor
        requestButton.layer.cornerRadius = 15.0
        requestButton.addTarget(self, action: #selector(toFlightInfo), for: .touchUpInside)
        view.addSubview(requestButton)
    }
    
    @objc func toFlightInfo() {
        if flightNumInput.text == "" {
            self.requestButton.isUserInteractionEnabled = true
            displayAlert(title: "Information Missing", message: "No Flight Number Entered")
            return
        }
        flightNum = flightNumInput.text
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        pickedDate = formatter.string(from: datePicker.date)
        
        self.pullFlightData()
    }
    
    func pullFlightData() {
        loading = JGProgressHUD(style: .dark)
        loading?.textLabel.text = "Loading..."
        loading?.show(in: self.view)
        self.view.isUserInteractionEnabled = false
        
        LufthansaAPIClient.getAuthToken(completion: {
            LufthansaAPIClient.getFlightInfo(flightNum: self.flightNum, date: self.pickedDate, completion: { (flt) -> Void in
                self.loading?.dismiss()
                self.searchedFlight = flt
            })
        })
        
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? FlightInfoVC {
            nextVC.flight = searchedFlight
        }
    }
}
