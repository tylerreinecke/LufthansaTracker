//
//  FavoritesCell.swift
//  LufthansaMP4Skeleton
//
//  Created by Tyler Reinecke on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit

class FavoritesCell: UITableViewCell {

    var size : CGSize!
    
    var flNum : UILabel!
    var flStatus : UILabel!
    var flDepTime : UILabel!
    var flArrTime : UILabel!
    var flOrigin : UILabel!
    var flDestination : UILabel!
    var takeoff : UIImageView!
    var landing : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initCellFrom(size: CGSize) {
        self.size = size
        //UI Positioning
        flNum = UILabel(frame: CGRect(x: 10, y: 10, width: size.width / 2 - 10, height: size.height / 2 - 15))
        flNum.textAlignment = .left
        contentView.addSubview(flNum)
        
        flStatus = UILabel(frame: CGRect(x: 10, y: size.height / 2 + 5, width: size.width / 2 - 10, height: size.height / 2 - 15))
        flStatus.textAlignment = .left
        contentView.addSubview(flStatus)
        
        takeoff = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        takeoff.center = CGPoint(x: size.width / 2 - 20, y: flNum.frame.midY)
        takeoff.image = UIImage(named: "takeoffIcon")
        contentView.addSubview(takeoff)
        
        landing = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        landing.center = CGPoint(x: size.width / 2 - 20, y: flStatus.frame.midY)
        landing.image = UIImage(named: "landingIcon")
        contentView.addSubview(landing)
        
        flOrigin = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: flNum.frame.height))
        flOrigin.center = CGPoint(x: takeoff.frame.maxX + 30, y: flNum.frame.midY)
        flOrigin.textAlignment = .left
        contentView.addSubview(flOrigin)
        
        flDestination = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: flNum.frame.height))
        flDestination.center = CGPoint(x: landing.frame.maxX + 30, y: flStatus.frame.midY)
        flDestination.textAlignment = .left
        contentView.addSubview(flDestination)
        
        flDepTime = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: flNum.frame.height))
        flDepTime.center = CGPoint(x: flOrigin.frame.maxX + 27, y: flNum.frame.midY)
        flDepTime.textAlignment = .left
        contentView.addSubview(flDepTime)
        
        flArrTime = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: flStatus.frame.height))
        flArrTime.center = CGPoint(x: flDestination.frame.maxX + 27, y: flStatus.frame.midY)
        flArrTime.textAlignment = .left
        contentView.addSubview(flArrTime)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateFlight(to newFlight: Flight) {
        //UI Content
        flNum.text = newFlight.flightNumber
        flStatus.text = newFlight.flightStatus
        flOrigin.text = newFlight.originAirportCode + " @"
        flDestination.text = newFlight.destinationAirportCode + " @"
        /*
        guard let actualDep = newFlight.depActualTime else {
            guard let schedDep = newFlight.depSchedTime else {
                print("Both Departure times = nil")
                return
            }
        }
        guard let actualArr = newFlight.arrActualTime else {
            guard let schedArr = newFlight.arrSchedTime else {
                print("Both Arrival times = nil")
                return
            }
        }
        */
        flDepTime.text = newFlight.depActualTime
        flArrTime.text = newFlight.arrActualTime
    }

}
