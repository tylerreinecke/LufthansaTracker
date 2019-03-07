//
//  AirportMapVC.swift
//  LufthansaMP4Skeleton
//
//  Created by Tyler Reinecke on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import MapKit

class AirportMapVC: UIViewController {

    var map : MKMapView!
    var airportSelected : Airport!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }

}
