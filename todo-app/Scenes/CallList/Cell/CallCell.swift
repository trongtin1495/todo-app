//
//  CallCell.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit
import Reusable

class CallCell: UITableViewCell, NibReusable {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    func bindViewModel(_ viewModel: CallItemViewModel?) {
        if let viewModel = viewModel {
            nameLabel.text = "Name: \(viewModel.name)"
            numberLabel.text = "Number: \(viewModel.number)"
        } else {
            nameLabel.text = "Name: "
            numberLabel.text = "Number: "
        }
    }
}


