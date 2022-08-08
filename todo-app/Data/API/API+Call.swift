//
//  API+Call.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import ObjectMapper
import RxSwift
import MGAPIService

extension API {
    func getCallList(_ input: GetCallListInput) -> Observable<[CallModel]> {
        return request(input)
    }
}

// MARK: - GetCallList
extension API {
    final class GetCallListInput: APIInput {
        init(page: Int, perPage: Int = 10) {
            super.init(urlString: API.Urls.getCallList,
                       parameters: [:],
                       method: .get,
                       requireAccessToken: false)
        }
    }
}
