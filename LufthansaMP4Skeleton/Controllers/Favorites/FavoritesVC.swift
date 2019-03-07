//
//  FavoritesVC.swift
//  LufthansaMP4Skeleton
//
//  Created by Tyler Reinecke on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit

class FavoritesVC: UIViewController {
    
    var favoritesTable : UITableView!
    var flight : Flight!
    var navBar : UINavigationBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
}
