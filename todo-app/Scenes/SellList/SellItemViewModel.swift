//
//  BuyItemViewModel.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import Foundation

struct SellItemViewModel {
    let name: String
    let price: Int
    let quantity: Int
    
    init(sell: SellModel) {
        self.name = sell.name
        self.price = sell.price
        self.quantity = sell.quantity
    }
}
