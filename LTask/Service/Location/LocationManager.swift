//
//  LocationManager.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManager {
    func getLocation(success: @escaping LocationSuccess, failure: @escaping Failure)
}

class LocationManagerImplementation : NSObject, LocationManager {
    fileprivate var success: LocationSuccess!
    fileprivate var failure: Failure!
    
    static let sharedManager = LocationManagerImplementation()
    fileprivate var currentLocation: CLLocation?
    fileprivate var locationManager: CLLocationManager
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func getLocation(success: @escaping LocationSuccess, failure: @escaping Failure) {
        self.success = success
        self.failure = failure
        guard let location = currentLocation else {
            locationManager.startUpdatingLocation()
            return
        }
        success(location)
    }
}

extension LocationManagerImplementation: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last, location.horizontalAccuracy >= 0 else {
            return
        }
        if self.currentLocation == nil {
            success(location)
        }
        self.currentLocation = location
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        failure(PersistenceError.location)
    }
}
