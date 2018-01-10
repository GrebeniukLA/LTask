//
//  SecondInteractor.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation

protocol SecondInteractor {
    func getForecastWeather(success:@escaping Success, failure:@escaping Failure)
}

class SecondInteractorImplementation: SecondInteractor {
    fileprivate let weatherService: MainService
    fileprivate let locationManager: LocationManager
    
    init(weatherService: MainService, locationManager: LocationManager) {
        self.weatherService = weatherService
        self.locationManager = locationManager
    }
    
    func getForecastWeather(success:@escaping Success, failure:@escaping Failure) {
        locationManager.getLocation(success: { [unowned self] (location) in
            self.weatherService.getCurrentWeather(location: location, success: success, failure: failure)
            }, failure: failure)
    }
}
