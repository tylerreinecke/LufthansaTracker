//
//  Flight.swift
//  LufthansaMP4Skevaron
//
//  Created by Max Miranda on 3/2/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import SwiftyJSON

class Flight {
    var flightNumber : String?
    var flightStatus : String?
    var aircraftCode : String?
    
    var originAirportCode : String!
    var depSchedTime : String?
    var depActualTime : String?
    var depSchedTimeShort : String?
    var depActualTimeShort : String?
    var depTerminal : String?
    var depGate : String?
    
    var destinationAirportCode : String!
    var arrSchedTime : String?
    var arrActualTime : String?
    var arrSchedTimeShort : String?
    var arrActualTimeShort : String?
    var arrTerminal : String?
    var arrGate : String?
    
    init(_ json: JSON, _ flNum: String) {
        flightNumber = flNum
        self.flightStatus = json["FlightStatus"]["Definition"].stringValue
        if flightStatus == "" {
            self.flightStatus = "N/A"
        }
        self.aircraftCode = json["Equipment"]["AircraftCode"].stringValue
        if aircraftCode == "" {
            self.aircraftCode = "N/A"
        }
        self.originAirportCode = json["Departure"]["AirportCode"].stringValue
        if originAirportCode == "" {
            self.originAirportCode = "N/A"
        }
        
        self.depSchedTime = json["Departure"]["ScheduledTimeUTC"]["DateTime"].stringValue
        if depSchedTime == "" {
            self.depSchedTime = "N/A"
        }
        self.depActualTime = json["Departure"]["ActualTimeUTC"]["DateTime"].stringValue
        if depActualTime == "" {
            self.depActualTime = "N/A"
        }
        
        self.depTerminal = json["Departure"]["Terminal"]["Name"].stringValue
        if depTerminal == "" {
            self.depTerminal = "N/A"
        }
        self.depGate = json["Departure"]["Terminal"]["Gate"].stringValue
        if depGate == "" {
            self.depGate = "N/A"
        }
        
        self.destinationAirportCode = json["Arrival"]["AirportCode"].stringValue
        if destinationAirportCode == "" {
            self.destinationAirportCode = "N/A"
        }
        self.arrSchedTime = json["Arrival"]["ScheduledTimeUTC"]["DateTime"].stringValue
        if arrSchedTime == "" {
            self.arrSchedTime = "N/A"
        }
        self.arrActualTime = json["Arrival"]["ActualTimeUTC"]["DateTime"].stringValue
        if arrActualTime == "" {
            self.arrActualTime = "N/A"
        }
        self.arrTerminal = json["Arrival"]["Terminal"]["Name"].stringValue
        if arrTerminal == "" {
            self.arrTerminal = "N/A"
        }
        self.arrGate = json["Arrival"]["Terminal"]["Gate"].stringValue
        if arrGate == "" {
            self.arrGate = "N/A"
        }
        
        var startIndex = depSchedTime!.index(depSchedTime!.startIndex, offsetBy: 11)
        var endIndex = depSchedTime!.index(startIndex, offsetBy: 5)
        var range = startIndex..<endIndex
        if depSchedTime == "N/A" {
            depSchedTimeShort = "N/A"
        } else {
            depSchedTimeShort = String(depSchedTime![range])
        }
        if depActualTime == "N/A" {
            depActualTimeShort = "N/A"
        } else {
            depActualTimeShort = String(depActualTime![range])
        }
        if arrSchedTime == "N/A" {
            arrSchedTimeShort = "N/A"
        } else {
            arrSchedTimeShort = String(arrSchedTime![range])
        }
        if arrActualTime == "N/A" {
            arrActualTimeShort = "N/A"
        } else {
            arrActualTimeShort = String(arrActualTime![range])
        }
    }
}
