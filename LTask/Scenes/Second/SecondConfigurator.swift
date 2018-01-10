//
//  SecondConfigurator.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation

protocol SecondConfigurator {
    func configure(controller: SecondViewController)
}

class SecondConfiguratorImplementation: SecondConfigurator {
    func configure(controller: SecondViewController) {
        let router = SecondRouterImplementation(viewController: controller)
        let weatherService = MainServiceImplementation()
        let locationManager = LocationManagerImplementation.sharedManager
        let interactor = SecondInteractorImplementation(weatherService: weatherService, locationManager: locationManager)
        let presenter = SecondPresenterImplementation(interactor: interactor, view: controller, router: router)
        controller.presenter = presenter
    }
}
