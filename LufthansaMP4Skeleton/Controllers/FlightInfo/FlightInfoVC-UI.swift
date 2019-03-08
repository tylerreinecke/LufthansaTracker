//
//  FlightInfoVC-UI.swift
//  LufthansaMP4Skeleton
//
//  Created by Tyler Reinecke on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import MapKit

extension FlightInfoVC {

    func initUI() {
        setupNavBar()
        setupInfo()
        setupDeparture()
        setupArrival()
        setupMapView()
    }
    
    func setupNavBar() {
        self.title = flight.flightNumber
        self.navigationController?.navigationBar.tintColor = Constants.jade
        self.navigationController?.isNavigationBarHidden = false
        addFavoritesButton = UIBarButtonItem(image: UIImage(named: "addFavoritesIcon"), style: .plain, target: self, action: #selector(addToFavorites))
        self.navigationItem.rightBarButtonItem = addFavoritesButton
    }
    
    func setupInfo() {
        status = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        status.center = CGPoint(x: view.frame.midX, y: 130)
        status.textAlignment = .center
        status.textColor = Constants.jade
        status.font = UIFont.boldSystemFont(ofSize: 26.0)
        status.text = flight.flightStatus
        view.addSubview(status)
        
        routeImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 170, height: 90))
        routeImage.center = CGPoint(x: view.frame.midX, y: status.frame.maxY + 60)
        routeImage.image = UIImage(named: "routeIcon")
        view.addSubview(routeImage)
        
        aircraftCode = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        aircraftCode.center = CGPoint(x: view.frame.midX, y: routeImage.frame.maxY)
        aircraftCode.textAlignment = .center
        aircraftCode.textColor = Constants.jade
        aircraftCode.font = UIFont.boldSystemFont(ofSize: 18.0)
        aircraftCode.text = "#\(flight.aircraftCode!)"
        view.addSubview(aircraftCode)
    }
    
    func setupDeparture() {
        origin = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        origin.center = CGPoint(x: routeImage.frame.minX - 45, y: routeImage.frame.midX + 15)
        origin.setTitle(flight?.originAirportCode, for: .normal)
        origin.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        origin.setTitleColor(Constants.jade, for: .normal)
        origin.backgroundColor = .white
        origin.layer.borderWidth = 2.0
        origin.layer.borderColor = Constants.jade.cgColor
        origin.layer.cornerRadius = 10.0
        origin.addTarget(self, action: #selector(originToAirportInfo), for: .touchUpInside)
        view.addSubview(origin)
        
        schedDep = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        schedDep.center = CGPoint(x: origin.frame.midX, y: origin.frame.maxY + 40)
        schedDep.textAlignment = .center
        schedDep.text = flight.depSchedTimeShort
        schedDep.font = UIFont.boldSystemFont(ofSize: 28.0)
        schedDep.textColor = Constants.gray
        view.addSubview(schedDep)
        
        actualDep = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        actualDep.center = CGPoint(x: origin.frame.midX, y: schedDep.frame.maxY + 30)
        actualDep.textAlignment = .center
        actualDep.text = flight.depActualTimeShort
        actualDep.font = UIFont.boldSystemFont(ofSize: 28.0)
        actualDep.textColor = Constants.redOrange
        view.addSubview(actualDep)
        
        depTermGate = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        depTermGate.center = CGPoint(x: origin.frame.midX, y: actualDep.frame.maxY + 30)
        depTermGate.textAlignment = .center
        depTermGate.text = "\(flight.depTerminal!) - \(flight.depGate!)"
        depTermGate.font = UIFont.boldSystemFont(ofSize: 28.0)
        depTermGate.textColor = Constants.gray
        view.addSubview(depTermGate)
        
    }
    
    func setupArrival() {
        destination = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        destination.center = CGPoint(x: routeImage.frame.maxX + 45, y: routeImage.frame.midX + 15)
        destination.setTitle(flight?.destinationAirportCode, for: .normal)
        destination.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30.0)
        destination.setTitleColor(Constants.jade, for: .normal)
        destination.backgroundColor = .white
        destination.layer.borderWidth = 2.0
        destination.layer.borderColor = Constants.jade.cgColor
        destination.layer.cornerRadius = 10.0
        destination.addTarget(self, action: #selector(destinationToAirportInfo), for: .touchUpInside)
        view.addSubview(destination)
        
        schedArr = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        schedArr.center = CGPoint(x: destination.frame.midX, y: destination.frame.maxY + 40)
        schedArr.textAlignment = .center
        schedArr.text = flight.arrSchedTimeShort
        schedArr.font = UIFont.boldSystemFont(ofSize: 28.0)
        schedArr.textColor = Constants.gray
        view.addSubview(schedArr)
        
        actualArr = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        actualArr.center = CGPoint(x: destination.frame.midX, y: schedArr.frame.maxY + 30)
        actualArr.textAlignment = .center
        actualArr.text = flight.arrActualTimeShort
        actualArr.font = UIFont.boldSystemFont(ofSize: 28.0)
        actualArr.textColor = Constants.redOrange
        view.addSubview(actualArr)
        
        arrTermGate = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        arrTermGate.center = CGPoint(x: destination.frame.midX, y: actualArr.frame.maxY + 30)
        arrTermGate.textAlignment = .center
        arrTermGate.text = "\(flight.arrTerminal!) - \(flight.arrGate!)"
        arrTermGate.font = UIFont.boldSystemFont(ofSize: 28.0)
        arrTermGate.textColor = Constants.gray
        view.addSubview(arrTermGate)
        
        schedTag = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        schedTag.center = CGPoint(x: view.frame.midX, y: schedDep.frame.midY)
        schedTag.text = "Scheduled"
        schedTag.textAlignment = .center
        schedTag.textColor = Constants.gray
        schedTag.font = UIFont.boldSystemFont(ofSize: 15.0)
        view.addSubview(schedTag)
        
        actualTag = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        actualTag.center = CGPoint(x: view.frame.midX, y: actualDep.frame.midY)
        actualTag.text = "Actual"
        actualTag.textAlignment = .center
        actualTag.textColor = Constants.gray
        actualTag.font = UIFont.boldSystemFont(ofSize: 15.0)
        view.addSubview(actualTag)
        
        termGateTag = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
        termGateTag.center = CGPoint(x: view.frame.midX, y: depTermGate.frame.midY)
        termGateTag.text = "Terminal - Gate"
        termGateTag.textAlignment = .center
        termGateTag.textColor = Constants.gray
        termGateTag.font = UIFont.boldSystemFont(ofSize: 15.0)
        view.addSubview(termGateTag)
    }
    
    func setupMapView() {
        var origTitle = origin.title(for: .normal)!
        var orig = Constants.airports[origTitle]!
        var destTitle = destination.title(for: .normal)!
        print(destTitle)
        var dest = Constants.airports[destTitle]!
        map = MKMapView(frame: CGRect(x: 0, y: view.frame.height / 2, width: view.frame.width, height: view.frame.height / 2))
        map.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        map.delegate = self
        var coord = CLLocationCoordinate2D(latitude: orig.latitude, longitude: orig.longitude)
        map.setCenter(coord.middleLocationWith(location: CLLocationCoordinate2D(latitude: dest.latitude, longitude: dest.longitude)), animated: true)
        map.isZoomEnabled = true
        map.isRotateEnabled = true
        map.isScrollEnabled = true
        map.addAnnotation(orig)
        map.addAnnotation(dest)
        view.addSubview(map)
    }
    
    @objc func addToFavorites() {
        if !Constants.favorites.contains(where: {$0.flightNumber == self.flight.flightNumber}) {
            Constants.favorites.append(self.flight)
            displayAlert(title: "Flight added to Favorites!", message: "")
        } else {
            displayAlert(title: "Error!", message: "Flight already favorited")
        }
    }
    
    @objc func originToAirportInfo() {
        airportSelected = Constants.airports[origin.title(for: .normal)!]
        self.performSegue(withIdentifier: "flightToAirportInfo", sender: self)
    }
    
    @objc func destinationToAirportInfo() {
        airportSelected = Constants.airports[destination.title(for: .normal)!]
        self.performSegue(withIdentifier: "flightToAirportInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? AirportInfoVC {
            nextVC.airport = airportSelected
        }
    }
    
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
}
