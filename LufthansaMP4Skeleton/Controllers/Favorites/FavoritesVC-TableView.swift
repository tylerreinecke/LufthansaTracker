//
//  FavoritesVC-TableView.swift
//  LufthansaMP4Skeleton
//
//  Created by Tyler Reinecke on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit

extension FavoritesVC: UITableViewDataSource, UITableViewDelegate {
    func height(for index: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritesCell") as! FavoritesCell
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        cell.initCellFrom(size: CGSize(width: tableView.frame.width, height: height(for: indexPath)))
        flight = Constants.favorites[indexPath.row]
        cell.updateFlight(to: flight)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        flight = Constants.favorites[indexPath.row]
        self.performSegue(withIdentifier: "favToFlightInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? FlightInfoVC {
            nextVC.flight = flight
        }
    }
}
