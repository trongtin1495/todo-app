//
//  API+Buy.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import ObjectMapper
import RxSwift
import MGAPIService

extension API {
    func getBuyList(_ input: GetBuyListInput) -> Observable<[BuyModel]> {
        return request(input)
    }
}

// MARK: - GetRepoList
extension API {
    final class GetBuyListInput: APIInput {
        init(page: Int, perPage: Int = 10) {
            super.init(urlString: API.Urls.getBuyList,
                       parameters: [:],
                       method: .get,
                       requireAccessToken: false)
        }
    }
}
