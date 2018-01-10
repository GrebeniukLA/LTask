//
//  FirstInteractor.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
import CoreData

protocol FirstInteractor {
    func requestForecastWeather(success:@escaping Success, failure:@escaping Failure)
//    func fetchedResultsController(delegate:NSFetchedResultsControllerDelegate?) -> NSFetchedResultsController<CDForecastWeather>
}

class FirstInteractorImplementation: NSObject, FirstInteractor {
    fileprivate let firstService: FirstService
    fileprivate let locationManager: LocationManager
    fileprivate let coreDataService: CoreDataService
    
    init(firstService: FirstService, locationManager: LocationManager, coreDataService: CoreDataService) {
        self.firstService = firstService
        self.locationManager = locationManager
        self.coreDataService = coreDataService
    }
    
    func requestForecastWeather(success:@escaping Success, failure:@escaping Failure) {
//        locationManager.getLocation(success: { [unowned self] (location) in
//            self.weatherService.getForecastWeather(location: location, success: { [unowned self] (forecastWeather) in
//                self.coreDataService.deleteAll(request: CDForecastWeather.fetchRequest(), context: ContextType.main.context)
//                self.coreDataService.addForecastWeather(forecastWeather)
//                success()
//                }, failure: failure)
//            }, failure: failure)
    }
    
//    func fetchedResultsController(delegate:NSFetchedResultsControllerDelegate?) -> NSFetchedResultsController<CDForecastWeather> {
//        let fetchRequest: NSFetchRequest<CDForecastWeather> = CDForecastWeather.fetchRequest()
//        let sortDescriptor = NSSortDescriptor(key: "location", ascending: true)
//        fetchRequest.sortDescriptors = [sortDescriptor]
//        let controler = NSFetchedResultsController.init(fetchRequest: fetchRequest, managedObjectContext: ContextType.main.context, sectionNameKeyPath: nil, cacheName: nil)
//        controler.delegate = delegate
//        do {
//            try controler.performFetch()
//        } catch {
//            print(error)
//        }
//        return controler
//    }
}

