//
//  BuyCell.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit
import Reusable

class BuyCell: UITableViewCell, NibReusable {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    func bindViewModel(_ viewModel: BuyItemViewModel?) {
        if let viewModel = viewModel {
            nameLabel.text = String(format: "Name: %@", viewModel.name)
            priceLabel.text = String(format: "Price: %d", viewModel.price)
            quantityLabel.text = String(format: "Quantity: %d", viewModel.quantity)
        } else {
            nameLabel.text = "Name: "
            priceLabel.text = "Price: "
            quantityLabel.text = "Quantity: "
        }
    }
}
