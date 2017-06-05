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
    
    var heading:CLLocationManager!
    
    func Heading(_ manager: CLLocationManager, didUpdateHeading new: CLHeading){
        UIView.animate(withDuration:0.4){
            let angle = CGFloat(new.trueHeading) * .pi / 180
            self.arrow.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        heading = CLLocationManager()
        heading.delegate = self
        heading.startUpdatingHeading()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
       
        
    }


}

