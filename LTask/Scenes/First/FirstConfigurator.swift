//
//  FirstConfigurator.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
protocol FirstConfigurator {
    func configure(controller: FirstViewController)
}

class FirstConfiguratorImplementation: FirstConfigurator {
    func configure(controller: FirstViewController) {
        let router = FirstRouterImplementation(viewController: controller)
        let firstService = FirstServiceImplementation()
        let coreDataService = CoreDataServiceImplementation()
        let locationManager = LocationManagerImplementation.sharedManager
        let interactor = FirstInteractorImplementation(firstService: firstService, locationManager: locationManager, coreDataService: coreDataService)
        let presenter = FirstPresenterImplementation(interactor: interactor, view: controller, router: router)
        controller.presenter = presenter
    }
}
