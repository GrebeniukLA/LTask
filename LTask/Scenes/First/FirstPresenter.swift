//
//  FirstPresenter.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
import CoreLocation
import CoreData

protocol FirstView: BaseViewControllerProtocol {
//    func setupLabel(weather: ForecastWeather?)
    func setupTable()
    func reloadTable()
}

protocol FirstPresenter {
//    var weather: ForecastWeather? { get }
    func viewDidLoad()
    func requestData()
    func configure(cell: FirstTableViewCellProtocol, forRow row: Int)
}

class FirstPresenterImplementation: NSObject, FirstPresenter {
    fileprivate let interactor: FirstInteractor
    fileprivate weak var view: FirstView?
    internal let router: FirstRouter
//    var fetch: NSFetchedResultsController<CDForecastWeather>!
//    internal var weather: ForecastWeather? {
//        didSet {
//            view?.setupLabel(weather: weather)
//            view?.reloadTable()
//        }
//    }
    
    init(interactor: FirstInteractor, view: FirstView, router: FirstRouter) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
    
    func viewDidLoad() {
//        fetch = interactor.fetchedResultsController(delegate: self)
//        if let cdForecastWeather = fetch.fetchedObjects?.first {
//            weather = ForecastWeather(cdForecastWeather)
//        }
//        view?.setupLabel(weather: weather)
        view?.setupTable()
    }
    
    func requestData() {
        interactor.requestForecastWeather(success: { [unowned self] () in
            self.view?.dismissLoading()
        }) { [unowned self] (error) in
            self.view?.dismissLoading()
            self.view?.showError(error: error)
        }
    }
    
    func configure(cell: FirstTableViewCellProtocol, forRow row: Int) {
//        guard let weather = self.weather else {
//            return
//        }
//        let forecast = weather.forecasts[row];
//        cell.setup(forecast: forecast)
    }
}

extension FirstPresenterImplementation: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        if let cdForecastWeather = controller.fetchedObjects?.first as? CDForecastWeather {
//            weather = ForecastWeather(cdForecastWeather)
//        }
    }
}
