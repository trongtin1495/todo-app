//
//  BuyModel.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import ObjectMapper
import Then

struct BuyModel {
    var id = 0
    var name = ""
    var price: UInt = 0
    var quantity: UInt = 0
    var type: Int = 0
}

extension BuyModel: Then, Equatable { }

extension BuyModel: Mappable {
    
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        price <- map["price"]
        quantity <- map["quantity"]
        type <- map["type"]
    }
}
