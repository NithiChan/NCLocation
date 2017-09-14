//
//  ViewController.swift
//  GoogleMapRotation
//
//  Created by Nithi on 13/09/17.
//  Copyright © 2017 CVN. All rights reserved.
//

import UIKit
import GoogleMaps


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var gMap:GMSMapView!

    var locationManager:CLLocationManager?
    
    var gMarker:GMSMarker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NCLocationManager.shared.getCurrentLocation { (manager, location) in
            if let current:CLLocation = location { // This is an Optional Check
               self.updateMapDisplay(my2D: current.coordinate)
            }
        }
    }
    
    func updateMapDisplay(my2D:CLLocationCoordinate2D) {
        let gCamPosition = GMSCameraPosition(target: my2D, zoom: 18.0, bearing: 0, viewingAngle: 0)
        self.gMap.animate(to: gCamPosition)
        
        if self.gMarker == nil {
            gMarker = GMSMarker()
            gMarker?.title = "Your Location"
            gMarker?.position = my2D
            gMarker?.isDraggable = true
            gMarker?.groundAnchor = CGPoint(x: 0.5, y: 0.5)
            self.gMarker?.map = self.gMap
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func  getMyLocation(sender:UIButton) {
        NCLocationManager.shared.getCurrentLocation { (manager, location) in
            if let current = location { // This is an Optional Check
                debugPrint(current)
            }
        }
    }

}

