//
//  BuyGateway.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit
import RxSwift
import MGArchitecture

protocol BuyGatewayType {
    func getBuyList(dto: GetPageDto) -> Observable<PagingInfo<BuyModel>>
}

struct BuyGateway: BuyGatewayType {
    func getBuyList(dto: GetPageDto) -> Observable<PagingInfo<BuyModel>> {
        let (page, perPage, usingCache) = (dto.page, dto.perPage, dto.usingCache)
        
        let input = API.GetBuyListInput(page: page, perPage: perPage)
        input.usingCache = usingCache
        
        return API.shared.getBuyList(input).map({ PagingInfo(page: 1, items: $0) })
    }
}
