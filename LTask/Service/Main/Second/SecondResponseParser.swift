//
//  SecondResponseParser.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
import SwiftyJSON

class SecondResponseParser: ResponseParserProtocol {
    
    let success: Success
    let failure: Failure
    
    init(success: @escaping Success,
         failure: @escaping Failure) {
        self.success = success
        self.failure = failure
    }
    
    func parse(json: JSON) {
        guard let tempDegrees = json["main"]["temp"].double,
            let windSpeed = json["wind"]["speed"].double,
            let country = json["sys"]["country"].string,
            let windDeg = json["wind"]["deg"].double else {
                handleError(error: PersistenceError.general)
                return
        }
//        let wind = Wind(speed: windSpeed, deg: windDeg)
//        let temperature = Temperature(country: country, openWeatherMapDegrees: tempDegrees)
//        let currentWeather = CurrentWeather(temperature: temperature.degrees, wind: wind)
//        success(currentWeather)
        success()
    }
    
    func handleError(error: PersistenceError) {
        failure(error)
    }
}
