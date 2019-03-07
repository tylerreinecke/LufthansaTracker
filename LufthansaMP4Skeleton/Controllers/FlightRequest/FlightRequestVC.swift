//
//  FlightRequestVC.swift
//  LufthansaMP4Skeleton
//
//  Created by Tyler Reinecke on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import JGProgressHUD
import SkyFloatingLabelTextField

class FlightRequestVC: UIViewController {

    var flightNumInput : SkyFloatingLabelTextFieldWithIcon!
    var datePicker : UIDatePicker!
    var dateLabel : UILabel!
    var requestButton : UIButton!
    var loading: JGProgressHUD?
    var pickedDate : String!
    var flightNum : String!
    var searchedFlight : Flight! {
        didSet {
            self.performSegue(withIdentifier: "toFlightInfo", sender: self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.isUserInteractionEnabled = true
    }
}
