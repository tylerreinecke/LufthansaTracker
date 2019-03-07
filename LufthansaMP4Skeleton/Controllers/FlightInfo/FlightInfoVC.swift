//
//  FlightInfoVC.swift
//  LufthansaMP4Skeleton
//
//  Created by Tyler Reinecke on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import MapKit

class FlightInfoVC: UIViewController {
    
    var flight : Flight!
    var airportSelected : Airport!

    var addFavoritesButton : UIBarButtonItem!
    
    var status : UILabel!
    var origin : UIButton!
    var destination : UIButton!
    var planeImage : UIImageView!
    var routeImage : UIImageView!
    var depTermGate : UILabel!
    var arrTermGate : UILabel!
    var schedDep : UILabel!
    var actualDep : UILabel!
    var schedArr : UILabel!
    var actualArr : UILabel!
    
    var map : MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(flight!)
        initUI()
    }
}
