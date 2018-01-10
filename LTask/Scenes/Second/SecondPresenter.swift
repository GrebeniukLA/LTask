//
//  SecondPresenter.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation
import CoreLocation

protocol SecondWeatherView: BaseViewControllerProtocol {
//    func setupLabelView(weather: CurrentWeather?)
//    func setupWindImageView(weather: CurrentWeather?)
}

protocol SecondPresenter {
    func viewDidLoad()
    func requestData()
}

class SecondPresenterImplementation: SecondPresenter {
    fileprivate let interactor: SecondInteractor
    fileprivate weak var view: SecondWeatherView?
    internal let router: SecondRouter
    
    init(interactor: SecondInteractor, view: SecondWeatherView, router: SecondRouter) {
        self.interactor = interactor
        self.view = view
        self.router =  router
    }
    
    func viewDidLoad() {
//        view?.setupLabelView(weather: nil)
//        view?.setupWindImageView(weather: nil)
    }
    
    func requestData() {
        interactor.getForecastWeather(success: { [unowned self] () in
//            self.view?.setupLabelView(weather: curentWeather)
//            self.view?.setupWindImageView(weather: curentWeather)
            self.view?.dismissLoading()
        }) { [unowned self] (error) in
            self.view?.dismissLoading()
            self.view?.showError(error: error)
        }
    }
}
