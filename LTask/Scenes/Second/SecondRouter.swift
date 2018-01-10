//
//  SecondRouter.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import Foundation

protocol SecondRouter: ViewRouter {
    func dismiss()
}

class SecondRouterImplementation: SecondRouter {
    fileprivate weak var viewController: SecondViewController?
    
    init(viewController: SecondViewController) {
        self.viewController = viewController
    }
    
    func dismiss() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
