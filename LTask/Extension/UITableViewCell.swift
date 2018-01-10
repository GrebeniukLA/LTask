//
//  UITableViewCell.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import UIKit

extension UITableViewCell {
    class func reuseIdentifier() -> String {
        return "\(self)"
    }
    
    class func nib() -> UINib {
        return UINib(nibName: reuseIdentifier(), bundle: nil)
    }
    
    class func registerNibCell(_ tableView: UITableView) {
        tableView.register(nib(), forCellReuseIdentifier: reuseIdentifier())
    }
}
