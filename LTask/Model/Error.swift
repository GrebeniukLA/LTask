//
//  Error.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation

enum PersistenceError: Error {
    case notConnectedToInternet
    case general
    case location
}
