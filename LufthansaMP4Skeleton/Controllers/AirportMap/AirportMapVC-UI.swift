//
//  AirportMapVC-UI.swift
//  LufthansaMP4Skeleton
//
//  Created by Tyler Reinecke on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import MapKit

extension AirportMapVC {

    func initUI() {
        self.title = "Airports"
        self.navigationController?.navigationBar.tintColor = Constants.jade
        self.navigationController?.isNavigationBarHidden = false
        
        map = MKMapView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        map.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        map.delegate = self
        map.setCenter(CLLocationCoordinate2D(latitude: 50.3785, longitude: 14.9706), animated: true)
        map.isZoomEnabled = true
        map.isRotateEnabled = true
        map.isScrollEnabled = true
        map.addAnnotations(Array(Constants.airports.values))
        view.addSubview(map)
        
    }
    
}
