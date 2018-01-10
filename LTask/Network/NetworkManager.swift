//
//  NetworkManager.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


protocol RequestBuilderProtocol {
    var method: HTTPMethod { get }
    var path: URLConvertible? { get }
    var parameters: Parameters? { get }
}

protocol ResponseParserProtocol {
    func parse(json: JSON)
    func handleError(error: PersistenceError)
}

protocol NetworkManagerProtocol {
    func performRequest(requestBuilder: RequestBuilderProtocol, reponseParser: ResponseParserProtocol)
}

class NetworkManager: NetworkManagerProtocol {
    
    static let sharedManager = NetworkManager()
    fileprivate let networkReachabilityManager = NetworkReachabilityManager()
    
    func performRequest(requestBuilder: RequestBuilderProtocol, reponseParser: ResponseParserProtocol) {
        
        guard networkReachabilityManager?.isReachable == true else {
            reponseParser.handleError(error:PersistenceError.notConnectedToInternet)
            return
        }
        
        guard let path = requestBuilder.path else {
            reponseParser.handleError(error:PersistenceError.general)
            return
        }
        
        Alamofire.request(path, method: requestBuilder.method, parameters: requestBuilder.parameters).validate().responseJSON
            { response in
                guard let json = response.result.value else {
                    reponseParser.handleError(error:PersistenceError.general)
                    return
                }
                reponseParser.parse(json: JSON(json))
        }
    }
}
