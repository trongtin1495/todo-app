//
//  SellModel.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import Foundation
import Then

struct SellModel {
    var id: Int = 0
    var name = ""
    var price: Int = 0
    var quantity: Int = 0
    var type: Int = 0
}

// MARK: - CoreDataModel
extension SellModel: CoreDataModel {
    static var primaryKey: String {
        return "id"
    }
    
    var modelID: String {
        return String(id)
    }
}

extension SellModel: Then { }
