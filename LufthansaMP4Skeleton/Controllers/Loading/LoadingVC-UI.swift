//
//  LoadingVC-UI.swift
//  LufthansaMP4Skeleton
//
//  Created by Tyler Reinecke on 3/5/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit
import JGProgressHUD

extension LoadingVC {

    func initUI() {
        loading = JGProgressHUD(style: .dark)
        loading.textLabel.text = "Loading..."
        loading.show(in: self.view)
        //loading.dismiss once it's done, then segue to flight info
    }
}
