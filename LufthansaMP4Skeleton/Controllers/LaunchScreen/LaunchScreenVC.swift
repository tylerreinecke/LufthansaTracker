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
        launchButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        launchButton.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
        launchButton.setTitleColor(UIColor(red: 108/255, green: 169/255, blue: 130/255, alpha: 1.0), for: .normal)
        launchButton.layer.borderWidth = 3.0
        launchButton.layer.cornerRadius = 15.0
        launchButton.layer.borderColor = UIColor(red: 108/255, green: 169/255, blue: 130/255, alpha: 1.0).cgColor
        launchButton.addTarget(self, action: #selector(pressLaunch), for: .touchUpInside)
        view.addSubview(launchButton)
    }
    
    func loadAirports() {
        LufthansaAPIClient.getAuthToken {
            LufthansaAPIClient.getAirports(limit: "100", offset: "0", completion: {
                print(":)")
            })
            LufthansaAPIClient.getAirports(limit: "100", offset: "100", completion: {
                print(":)")
            })
            LufthansaAPIClient.getAirports(limit: "30", offset: "200", completion: {
                print(":)")
            })
        }
    }
    
    @objc func pressLaunch() {
        self.performSegue(withIdentifier: "exitLaunchScreen", sender: self)
    }
}
