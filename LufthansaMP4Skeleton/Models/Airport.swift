//
//  Airport.swift
//  LufthansaMP4Skeleton
//
//  Created by Tyler Reinecke on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import SwiftyJSON
import MapKit

class Airport: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    var name : String!
    var code : String!
    var latitude : Double!
    var longitude : Double!
    var depFlights = [Flight]()
    var arrFlights = [Flight]()
    
    
    init(_ json: JSON) {
        self.name = json["Names"]["Name"]["$"].stringValue
        self.code = json["AirportCode"].stringValue
        self.latitude = json["Position"]["Coordinate"]["Latitude"].doubleValue
        self.longitude = json["Position"]["Coordinate"]["Longitude"].doubleValue
        
        self.coordinate = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        self.title = self.name
        self.subtitle = self.code
        
        super.init()
    }
}
