//
//  LaunchScreenViewController.swift
//  LufthansaMP4Skeleton
//
//  Created by Tyler Reinecke on 3/6/19.
//  Copyright © 2019 ___MaxAMiranda___. All rights reserved.
//

import UIKit

class LaunchScreenVC: UIViewController {
    
    var launchImage : UIImageView!
    var launchButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadAirports()
        
        launchImage = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        launchImage.image = UIImage(named: "lufthansaLaunch")
        view.addSubview(launchImage)
        
        launchButton = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        launchButton.center = CGPoint(x: view.frame.midX, y: view.frame.height - 150)
        launchButton.setTitle("Launch!", for: .normal)
        launchButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
        launchButton.setTitleColor(Constants.jade, for: .normal)
        launchButton.layer.borderWidth = 3.0
        launchButton.layer.cornerRadius = 15.0
        launchButton.layer.borderColor = Constants.jade.cgColor
        launchButton.addTarget(self, action: #selector(pressLaunch), for: .touchUpInside)
        view.addSubview(launchButton)
    }
    
    func loadAirports() {
        LufthansaAPIClient.getAuthToken {
            LufthansaAPIClient.getAirports1(completion: {
                print("We got airports 1 :)")
            })
            LufthansaAPIClient.getAirports2(completion: {
                print("We got airports 2 :)")
            })
            LufthansaAPIClient.getAirports3(completion: {
                print("We got airports 3 :)")
            })
        }
    }
    
    @objc func pressLaunch() {
        self.performSegue(withIdentifier: "exitLaunchScreen", sender: self)
    }
}
