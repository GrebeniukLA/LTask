//
//  FirstViewRouter.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation

protocol FirstRouter: ViewRouter {
    func presentSecondViewController()
}

class FirstRouterImplementation: FirstRouter {
    fileprivate weak var viewController: FirstViewController?
    
    init(viewController: FirstViewController) {
        self.viewController = viewController
    }
    
    func presentSecondViewController() {
        viewController?.performSegue(withIdentifier: "SecondViewController", sender: nil)
    }
}
