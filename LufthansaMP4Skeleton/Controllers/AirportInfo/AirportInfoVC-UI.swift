//
//  AirportInfoVC-UI.swift
//  LufthansaMP4Skeleton
//
//  Created by Tyler Reinecke on 3/6/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import MapKit

extension AirportInfoVC {

    func initUI() {
        //departingFlights.append
        self.title = airport.name
        setupMapView()
        setupViewSelect()
        setupDepartingTable()
        setupArrivingTable()
        view.addSubview(departingTable)
    }
    
    func setupMapView() {
        map = MKMapView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height / 3))
        map.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        map.delegate = self
        map.setCenter(CLLocationCoordinate2D(latitude: airport.latitude, longitude: airport.longitude), animated: true)
        map.isZoomEnabled = true
        map.isRotateEnabled = true
        map.isScrollEnabled = true
        map.addAnnotation(airport)
        view.addSubview(map)
    }
    
    func setupViewSelect() {
        viewSelect = UISegmentedControl(items: ["Departing", "Arriving"])
        viewSelect.frame = CGRect(x: 0, y: 0, width: view.frame.width + 10, height: 30)
        viewSelect.center = CGPoint(x: view.frame.width / 2, y: map.frame.maxY + 15)
        viewSelect.selectedSegmentIndex = 0
        viewSelect.addTarget(self, action: #selector(selectView), for: .valueChanged)
        viewSelect.tintColor = Constants.jade
        view.addSubview(viewSelect)
    }
    
    func setupDepartingTable() {
        departingTable = UITableView(frame: CGRect(x: 0, y: viewSelect.frame.maxY, width: view.frame.width, height: view.frame.height / 3 * 2 - 30))
        departingTable.register(FavoritesCell.self,forCellReuseIdentifier: "favoritesCell")
        departingTable.delegate = self
        departingTable.dataSource = self
    }
    
    func setupArrivingTable() {
        arrivingTable = UITableView(frame: CGRect(x: 0, y: viewSelect.frame.maxY, width: view.frame.width, height: view.frame.height / 3 * 2 - 30))
        arrivingTable.register(FavoritesCell.self,forCellReuseIdentifier: "favoritesCell")
        arrivingTable.delegate = self
        arrivingTable.dataSource = self
    }
    
    @objc func selectView() {
        if viewSelect.selectedSegmentIndex == 0 {
            view.addSubview(departingTable)
            arrivingTable.removeFromSuperview()
        } else {
            view.addSubview(arrivingTable)
            departingTable.removeFromSuperview()
        }
    }
    
}
