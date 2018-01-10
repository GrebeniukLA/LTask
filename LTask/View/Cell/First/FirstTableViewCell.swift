//
//  FirstTableViewCell.swift
//  LTask
//
//  Created by Leonid Grebeniuk on 10/01/2018.
//  Copyright © 2018 LG. All rights reserved.
//

import UIKit

protocol FirstTableViewCellProtocol {
    func setup(_ data: Any)
}

class FirstTableViewCell: UITableViewCell, FirstTableViewCellProtocol {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    func setup(_ data: Any) {
        //TODO:
//        titleLabel.text =
//        valueLabel.text =
    }
}
