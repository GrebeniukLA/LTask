//
//  Typealias.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
import CoreLocation

typealias Failure = (PersistenceError) -> Void
typealias Success = () -> Void
//typealias FirstSuccess = (ForecastWeather) -> Void
//typealias CurrentWeatherSuccess = (CurrentWeather) -> Void
//typealias FasebookNameSuccess = (String) -> Void
typealias LocationSuccess = (CLLocation) -> Void

