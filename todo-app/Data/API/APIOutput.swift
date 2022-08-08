//
//  APIOutput.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import ObjectMapper
import MGAPIService

class APIOutput: APIOutputBase {  // swiftlint:disable:this final_class
    var message: String?
    
    override func mapping(map: Map) {
        message <- map["message"]
    }
}
