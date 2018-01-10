//
//  SecondRequestBuilder.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation

class SecondRequestBuilder: RequestBuilderProtocol {
    
    var method : HTTPMethod {
        return .get
    }
    var path: URLConvertible? {
        return FirstServiceImplementation.Constants.baseServiceURL + "weather"
    }
    var parameters: Parameters? {
        return nil
//        return WeatherParameters.prepare(location)
    }
    
    var location: CLLocation
    
    init(location: CLLocation) {
        self.location = location
    }
}
