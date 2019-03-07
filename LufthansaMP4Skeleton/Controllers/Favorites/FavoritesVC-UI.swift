//
//  FavoritesVC-UI.swift
//  LufthansaMP4Skeleton
//
//  Created by Tyler Reinecke on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit

extension FavoritesVC {
    func initUI() {
        self.navigationItem.title = "Favorites"
        self.navigationController?.navigationBar.tintColor = Constants.jade
        self.navigationController?.isNavigationBarHidden = false
        
        favoritesTable = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        favoritesTable.register(FavoritesCell.self,forCellReuseIdentifier: "favoritesCell")
        favoritesTable.delegate = self
        favoritesTable.dataSource = self
        view.addSubview(favoritesTable)
    }
}
