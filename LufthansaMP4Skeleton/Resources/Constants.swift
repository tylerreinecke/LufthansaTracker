//
//  Constants.swift
//  LufthansaMP4Skeleton
//
//  Created by Tyler Reinecke on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit

class Constants {
    static var favorites = [Flight]()
    static var airports: [String: Airport] = [:] //key is airport code
    static let darkBlue = UIColor(red: 7/255, green: 24/255, blue: 178/255, alpha: 1.0)
    static let gold = UIColor(red: 244/255, green: 175/255, blue: 61/255, alpha: 1.0)
    static let jade = UIColor(red: 131/255, green: 191/255, blue: 179/255, alpha: 1.0)
    static let gray = UIColor(red: 102/255, green: 106/255, blue: 122/255, alpha: 1.0)
    static let redOrange = UIColor(red: 237/255, green: 103/255, blue: 81/255, alpha: 1.0)
}
