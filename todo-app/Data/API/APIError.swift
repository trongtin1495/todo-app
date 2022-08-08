//
//  APIError.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import MGAPIService
import Foundation

struct APIResponseError: APIError {
    let statusCode: Int?
    let message: String
    
    var errorDescription: String? {
        return message
    }
}
