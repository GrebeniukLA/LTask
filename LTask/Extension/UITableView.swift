//
//  UITableView.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(nibCell: T.Type) {
        register(T.nib(), forCellReuseIdentifier: T.reuseIdentifier())
    }
    
    func dequeue<T: UITableViewCell>(cell: T.Type, at indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier(), for: indexPath) as! T
    }
}
