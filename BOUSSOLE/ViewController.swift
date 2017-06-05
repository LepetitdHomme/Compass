//
//  ViewController.swift
//  BOUSSOLE
//
//  Created by Camille SELLIER on 6/5/17.
//  Copyright © 2017 Camille SELLIER. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    //outlet boussole
    @IBOutlet weak var arrow: UIImageView!
    
    var locationManager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading){
        UIView.animate(withDuration:0.4){
            var angle = CGFloat(-newHeading.trueHeading) * .pi / 180
            switch UIDevice.current.orientation {
            case .faceDown:
                angle = -angle
            default:
                angle = 0 + angle
            }
            switch UIApplication.shared.statusBarOrientation {
            case .landscapeLeft: angle += 90
            case .landscapeRight: angle -= 90
            default:angle = 0 + angle
            }
            self.arrow.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
            print (CGFloat(angle))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if (CLLocationManager.headingAvailable()){
            locationManager.headingFilter = 1
            locationManager.startUpdatingHeading()
            locationManager.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

