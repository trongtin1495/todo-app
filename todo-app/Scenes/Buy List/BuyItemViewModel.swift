//
//  BuyItemViewModel.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import Foundation

struct BuyItemViewModel {
    let name: String
    let price: UInt
    let quantity: UInt
    
    init(buy: BuyModel) {
        self.name = buy.name
        self.price = buy.price
        self.quantity = buy.quantity
    }
}
