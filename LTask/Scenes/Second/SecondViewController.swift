//
//  SecondViewController.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import UIKit
import CoreLocation
import SVProgressHUD

class SecondViewController: UIViewController, BaseViewControllerProtocol {
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windImageView: UIImageView!
    
    let configurator = SecondConfiguratorImplementation()
    var presenter : SecondPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(controller: self)
        presenter.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.requestData()
    }
}

extension SecondViewController: SecondWeatherView {
//    func setupLabelView(weather: CurrentWeather?) {
//        guard let weather = weather else {
//            temperatureLabel.text = "--"
//            return
//        }
//        temperatureLabel.text = weather.temperature
//    }
//
//    func setupWindImageView(weather: CurrentWeather?) {
//        guard let weather = weather else {
//            windImageView.alpha = 0.3
//            return
//        }
//        UIView.animate(withDuration: 1) {
//            self.windImageView.alpha = 1
//            self.windImageView.transform = CGAffineTransform(rotationAngle: weather.wind.deg.degreesToRadians )
//        }
//    }
}
