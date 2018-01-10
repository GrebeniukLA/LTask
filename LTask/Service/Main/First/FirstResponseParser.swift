//
//  FirstResponseParser.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
import SwiftyJSON

class FirstResponseParser: ResponseParserProtocol {
    let success: Success
    let failure: Failure
    
    init(success: @escaping Success,
         failure: @escaping Failure) {
        self.success = success
        self.failure = failure
    }
    
    func parse(json: JSON) {
        guard let city = json["city"]["name"].string else {
            handleError(error: PersistenceError.general)
            return
        }
//        var forecasts: [Forecast] = []
//        for index in 0..<json["list"].count {
//            guard let forecastTempDegrees = json["list"][index]["main"]["temp"].double,
//                let rawDateTime = json["list"][index]["dt"].double else {
//                    handleError(error: PersistenceError.general)
//                    return
//            }
//            let country = json["city"]["country"].string
//            let forecastTemperature = Temperature(country: country!, openWeatherMapDegrees: forecastTempDegrees)
//            let date = Date(timeIntervalSince1970: rawDateTime)
//            let forecast = Forecast(date: date, temperature: forecastTemperature.degrees)
//            forecasts.append(forecast)
//        }
//        let forecastWeather = ForecastWeather(location: city, forecasts: forecasts)
//        success(forecastWeather)
        success()
    }
    
    func handleError(error: PersistenceError) {
        failure(error)
    }
}
