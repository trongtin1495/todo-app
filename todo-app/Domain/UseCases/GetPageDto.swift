//
//  GetPageDto.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import Dto
import ValidatedPropertyKit
import Then

struct GetPageDto: Dto, Then {
    var page = 1
    var perPage = 10
    var usingCache = false
    
    var validatedProperties: [ValidatedProperty] {
        return []
    }
}
