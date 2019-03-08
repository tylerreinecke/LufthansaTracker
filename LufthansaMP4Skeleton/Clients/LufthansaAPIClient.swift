//
//  LufthansaAPIClient.swift
//  LufthansaMP4Skeleton
//
//  Created by Max Miranda on 3/2/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LufthansaAPIClient {
    //These are where we will store all of the authentication information. Get these from your account at developer.lufthansa.com.
    static var dateTime : Date!
    static let formatter = DateFormatter()
    static let clientSecret = "3YMbCkH4a4" //FIXME
    static let clientID = "e6easqd527mdkkpk54wez3mp" //FIXME
    
    //This variable will store the session's auth token that we will get from getAuthToken()
    static var authToken: String?
    
    //This function will request an auth token from the lufthansa servers
    static func getAuthToken(completion: @escaping () -> ()){
        //This is the information that will be sent to the server to authenticate our device
        let requestURL = "https://api.lufthansa.com/v1/oauth/token" //FIXME
        let parameters = ["client_id": clientID, "client_secret": clientSecret, "grant_type": "client_credentials"]
        
        //This is the POST request made to the lufthansa servers to get the authToken for this session.
        Alamofire.request(requestURL, method: .post , parameters: parameters, encoding: URLEncoding()).responseJSON { response in
            
            //Converts response to JSON object and sets authToken variable to appropriate value
            let json = JSON(response.result.value)
            self.authToken = json["access_token"].stringValue
            
            print("Auth token: " + self.authToken!)
            print("This key expires in " + json["expires_in"].stringValue + " seconds\n")
            
            //Runs completion closure
            completion()
        }
    }
    
    //This function will get the status for a flight. FlightNum format "LHXXX" Date format "YYYY-MM-DD"
    static func getFlightInfo(flightNum: String, date: String, completion: @escaping (Flight) -> ()){
        //Request URL and authentication parameters
        let requestURL = "https://api.lufthansa.com/v1/operations/flightstatus/\(flightNum)/\(date)"
        let parameters: HTTPHeaders = ["Authorization":"Bearer \(authToken!)", "Accept": "application/json"]
        
        Alamofire.request(requestURL, headers: parameters).responseJSON { response in
            //Makes sure that response is valid
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                displayErrorPopup(title: "Flight not found", message: "")
                return
            }
            print("We got flight info :)")
            //Creates JSON object
            let json = JSON(response.result.value)["FlightStatusResource"]["Flights"]["Flight"]
            //Create new flight model and populate data
            let flight = Flight(json, flightNum)
            completion(flight)
        }
    }
    
    static func getAirports(limit: String, offset: String, completion: @escaping () -> ()) {
        //Request URL and authentication parameters
        let requestURL = "https://api.lufthansa.com/v1/references/airports/?lang=en&limit=\(limit)&offset=\(offset)&LHoperated=1"
        let parameters: HTTPHeaders = ["Authorization":"Bearer \(authToken!)", "Accept": "application/json"]
        
        Alamofire.request(requestURL, headers: parameters).responseJSON { response in
            //Makes sure that response is valid
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
            //Creates JSON object
            let json = JSON(response.result.value)
            //print(json)
            //Create new flight model and populate data
            //let numAirports = json["AirportResource"]["Airports"]["Airport"].count
            
            for airport in json["AirportResource"]["Airports"]["Airport"]{
                var myAirport = Airport(airport.1)
                Constants.airports[myAirport.code] = myAirport
            }
            //print(Constants.airports)
            completion()
        }
    }
    
    static func getDepartures(airportCode: String, date: String, completion: @escaping ([Flight], _ numFlights: Int) -> ()) {
        dateTime = Date.init()
        formatter.dateFormat = "YYYY-MM-DD"
        var currDate = formatter.string(from: dateTime)
        formatter.dateFormat = "HH:mm"
        var currTime = formatter.string(from: dateTime)
        print("\(currDate)T\(currTime)")
        print("PEEP ABOVE")
        //Request URL and authentication parameters
        let requestURL = "https://api.lufthansa.com/v1/operations/flightstatus/departures/\(airportCode)/\(date)?limit=100"
        let parameters: HTTPHeaders = ["Authorization":"Bearer \(authToken!)", "Accept": "application/json"]
        
        Alamofire.request(requestURL, headers: parameters).responseJSON { response in
            //Makes sure that response is valid
            guard response.result.isSuccess else {
                print(response.result.error.debugDescription)
                return
            }
            //Creates JSON object
            let json = JSON(response.result.value)["FlightStatusResource"]["Flights"]["Flight"]
            
            //print(json)
            //Create new flight model and populate data
            //let numAirports = json["AirportResource"]["Airports"]["Airport"].count
            /*
            var departures: [Flight] = []
            for flight in json {
                var myFlight = Flight()
                departures.append(flight)
            }*/
            /*
            for flight in json{
                let flight = Flight(json, "N/A")
                
                
                var departure = Airport(airport.1)
                Constants.airports[myAirport.code] = myAirport
                //print(myAirport.code)
            }
            for depart in json["FlightStatusResource"]["Flights"]["Flight"]["Departure"]{
                var myAirport = Airport(airport.1)
                Constants.airports[myAirport.code] = myAirport
            }
 
            //print(Constants.airports)
            completion()
 */
        }
    }
    
    static func displayErrorPopup(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        UIViewController().present(alert, animated: true, completion: nil)
    }
}
