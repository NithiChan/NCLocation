//
//  NCLocationManager.swift
//  GoogleMapRotation
//
//  Created by Nithi on 14/09/17.
//  Copyright © 2017 CVN. All rights reserved.
//

import Foundation
import CoreLocation

typealias CompletionCallBack = (_ locationManager:CLLocationManager?, _ currentLocation:CLLocation?) ->Void

class NCLocationManager: NSObject, CLLocationManagerDelegate {
    static let shared:NCLocationManager = NCLocationManager()
    var locationManager:CLLocationManager?
    
    var locationBlock:CompletionCallBack?
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.distanceFilter = kCLDistanceFilterNone
        locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func getCurrentLocation(_ completion:@escaping CompletionCallBack) {
        if (CLLocationManager.locationServicesEnabled()){
            locationManager?.startUpdatingLocation()
        }
        locationBlock = completion
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = locations.last
        manager.stopUpdatingLocation()
        locationBlock!(manager, currentLocation!)
    }
}
