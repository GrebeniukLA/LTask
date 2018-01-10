//
//  CoreDataService.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
import CoreData

enum ContextType {
    case main, background
    var context: NSManagedObjectContext {
        switch self {
        case .main:
            return CoreDataManager.sharedManager.persistentContainer.viewContext
        case .background:
            return CoreDataManager.sharedManager.backgroundContext
        }
    }
}

protocol CoreDataService {
//    func addForecastWeather(_ forecastWeather: ForecastWeather)
    func deleteAll<T: NSManagedObject>(request: NSFetchRequest<T>, context:NSManagedObjectContext)
}

class CoreDataServiceImplementation: CoreDataService {
    
//    func addForecastWeather(_ forecastWeather: ForecastWeather) {
//        let context = ContextType.background.context
//        let cdForecastWeather = CDForecastWeather(context: context)
//        cdForecastWeather.location = forecastWeather.location
//        for forecast in forecastWeather.forecasts {
//            let cdForecast = CDForecast(context: context)
//            cdForecast.date = forecast.date as NSDate
//            cdForecast.temperature = forecast.temperature
//            cdForecastWeather.addToForecasts(cdForecast)
//        }
//        saveContext(context: context)
//    }
    
    func allRecords<T: NSManagedObject>(request: NSFetchRequest<T>, predicate: NSPredicate? = nil, sort: NSSortDescriptor? = nil, contextType:ContextType) -> [T] {
        return allRecords(request: request, predicate: predicate, sort: sort, context: contextType.context)
    }
    
    func allRecords<T: NSManagedObject>(request: NSFetchRequest<T>, predicate: NSPredicate? = nil, sort: NSSortDescriptor? = nil, context:NSManagedObjectContext) -> [T] {
        request.predicate = predicate
        do {
            let results = try context.fetch(request)
            return results
        }
        catch {
            print("Error with request: \(error)")
            return []
        }
    }
    
    func deleteAll<T: NSManagedObject>(request: NSFetchRequest<T>, context:NSManagedObjectContext) {
        let items = allRecords(request: request, context: context)
        do {
            for item in items {
                context.delete(item)
            }
            try context.save()
        } catch {
            print("Error with request: \(error)")
        }
    }
    
    func saveContext(context:NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error with request: \(error)")
            }
        }
    }
}
