//
//  CallModel.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import ObjectMapper
import Then

struct CallModel {
    var id = 0
    var name = ""
    var number = ""
}

extension CallModel: Then, Equatable { }

extension CallModel: Mappable {
    
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        number <- map["number"]
    }
}
