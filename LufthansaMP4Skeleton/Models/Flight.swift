//
//  Flight.swift
//  LufthansaMP4Skeleton
//
//  Created by Max Miranda on 3/2/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import SwiftyJSON

class Flight {
    let flightNumber : String
    let flightStatus : String
    let aircraftCode : String
    
    let originAirportCode : String!
    let depSchedTime : String
    let depActualTime : String
    let depSchedTimeShort : String
    let depActualTimeShort : String
    let depTerminal : String
    let depGate : String
    
    let destinationAirportCode : String!
    let arrSchedTime : String
    let arrActualTime : String
    let arrSchedTimeShort : String
    let arrActualTimeShort : String
    let arrTerminal : String
    let arrGate : String
    
    init(_ json: JSON, _ flNum: String) {
        flightNumber = flNum
        self.flightStatus = json["FlightStatusResource"]["Flights"]["Flight"]["FlightStatus"]["Definition"].stringValue
        self.aircraftCode = json["FlightStatusResource"]["Flights"]["Flight"]["Equipment"]["AircraftCode"].stringValue
        
        self.originAirportCode = json["FlightStatusResource"]["Flights"]["Flight"]["Departure"]["AirportCode"].stringValue
        self.depSchedTime = json["FlightStatusResource"]["Flights"]["Flight"]["Departure"]["ScheduledTimeUTC"]["DateTime"].stringValue
        self.depActualTime = json["FlightStatusResource"]["Flights"]["Flight"]["Departure"]["ActualTimeUTC"]["DateTime"].stringValue
        
        self.depTerminal = json["FlightStatusResource"]["Flights"]["Flight"]["Departure"]["Terminal"]["Name"].stringValue
        self.depGate = json["FlightStatusResource"]["Flights"]["Flight"]["Departure"]["Terminal"]["Gate"].stringValue
        
        self.destinationAirportCode = json["FlightStatusResource"]["Flights"]["Flight"]["Arrival"]["AirportCode"].stringValue
        self.arrSchedTime = json["FlightStatusResource"]["Flights"]["Flight"]["Arrival"]["ScheduledTimeUTC"]["DateTime"].stringValue
        self.arrActualTime = json["FlightStatusResource"]["Flights"]["Flight"]["Arrival"]["ActualTimeUTC"]["DateTime"].stringValue
        self.arrTerminal = json["FlightStatusResource"]["Flights"]["Flight"]["Arrival"]["Terminal"]["Name"].stringValue
        self.arrGate = json["FlightStatusResource"]["Flights"]["Flight"]["Arrival"]["Terminal"]["Gate"].stringValue
        
        let startIndex = depSchedTime.index(depSchedTime.startIndex, offsetBy: 11)
        let endIndex = depSchedTime.index(startIndex, offsetBy: 5)
        let range = startIndex..<endIndex
        depSchedTimeShort = String(depSchedTime[range])
        depActualTimeShort = String(depActualTime[range])
        arrSchedTimeShort = String(arrSchedTime[range])
        arrActualTimeShort = String(arrActualTime[range])
    }
}
