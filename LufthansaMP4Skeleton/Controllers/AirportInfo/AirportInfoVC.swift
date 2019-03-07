//
//  AirportInfoVC.swift
//  LufthansaMP4Skeleton
//
//  Created by Tyler Reinecke on 3/6/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import MapKit

class AirportInfoVC: UIViewController {

    var map : MKMapView!
    var airport : Airport!
    var flight : Flight!
    var flightTable : UITableView!
    var departingTable : UITableView!
    var arrivingTable : UITableView!
    var viewSelect : UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }

}
