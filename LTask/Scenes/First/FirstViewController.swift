//
//  FirstViewController.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import UIKit

import CoreLocation
import SVProgressHUD

class FirstViewController: UIViewController, BaseViewControllerProtocol {
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let configurator = FirstConfiguratorImplementation()
    var presenter: FirstPresenter!
    
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

extension FirstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
//        guard let weather = presenter.weather else {
//            return 0
//        }
//        return weather.forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
//        let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.reuseIdentifier(), for:indexPath) as! FirstTableViewCell
//        presenter.configure(cell: cell, forRow: indexPath.row)
//        return cell
    }
}

extension FirstViewController: FirstView {
    func setupTable() {
        tableView.register(nibCell: FirstTableViewCell.self)
    }
    
//    func setupLabel(weather: ForecastWeather?) {
//        guard let weather = weather else {
//            cityLabel.text = "--"
//            return
//        }
//        cityLabel.text = weather.location
//    }
    
    func reloadTable() {
        tableView.reloadData()
    }
}
