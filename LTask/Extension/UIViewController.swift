//
//  UIViewController.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol BaseViewControllerProtocol: class {
    func showLoading()
    func showError(error: PersistenceError)
    func dismissLoading()
}

extension BaseViewControllerProtocol where Self: UIViewController {
    func showLoading() {
        SVProgressHUD.setContainerView(view)
        SVProgressHUD.show()
    }
    func dismissLoading() {
        SVProgressHUD.dismiss()
    }
    
    func showError(error: PersistenceError) {
        let title = "Error"
        var message = ""
        
        switch error {
        case .notConnectedToInternet:
            message = "No internet connection"
            break
        case .location:
            message = "Your location could not be determined"
            break
        case .general:
            message = "Something went wrong."
            break
            
        }
        showAlert(title: title, message: message)
    }
    
    func showAlert(title: String, message: String, okAction: (()->Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let defaultOkAction = UIAlertAction(title: "OK", style: .cancel) {
            UIAlertAction in
            if let action = okAction {
                action()
            }
        }
        alert.addAction(defaultOkAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showError(error: Error, okAction: (()->Void)? = nil) {
        self.showAlert(title: "Error", message: error.localizedDescription, okAction: okAction)
    }
}
