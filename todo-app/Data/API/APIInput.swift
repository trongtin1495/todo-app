//
//  APIInput.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import Alamofire
import MGAPIService

class APIInput: APIInputBase {  // swiftlint:disable:this final_class
    override init(urlString: String,
                  parameters: [String: Any]?,
                  method: HTTPMethod,
                  requireAccessToken: Bool) {
        super.init(urlString: urlString,
                   parameters: parameters,
                   method: method,
                   requireAccessToken: requireAccessToken)
        self.headers = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json"
        ]
        self.user = nil
        self.password = nil
    }
}
