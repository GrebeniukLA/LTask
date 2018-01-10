//
//  MainService.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
import CoreLocation

protocol MainService {
    func getForecastWeather(location: CLLocation, success:@escaping Success, failure:@escaping Failure)
    func getCurrentWeather(location: CLLocation, success:@escaping Success, failure:@escaping Failure)
}

class MainServiceImplementation: MainService {
    struct Constants {
        static let kAPPID = "6aaa50e44cb76f02ca85089825588d62"
        static let baseServiceURL = "http://api.openweathermap.org/data/2.5/"
    }
    
    func getForecastWeather(location: CLLocation, success:@escaping Success, failure:@escaping Failure) {
        let requestBuilder = FirstRequestBuilder(location: location)
        let parserBuilder = FirstResponseParser(success: success, failure: failure)
        NetworkManager().performRequest(requestBuilder: requestBuilder, reponseParser: parserBuilder)
    }
    
    func getCurrentWeather(location: CLLocation, success:@escaping Success, failure:@escaping Failure) {
        let requestBuilder = SecondRequestBuilder(location: location)
        let parserBuilder = SecondResponseParser(success: success, failure: failure)
        NetworkManager().performRequest(requestBuilder: requestBuilder, reponseParser: parserBuilder)
    }
}
