//
//  BuyListUseCase.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import RxSwift
import MGArchitecture

protocol BuyListUseCaseType {
    func getBuyList(page: Int) -> Observable<PagingInfo<BuyModel>>
}

struct BuyListUseCase: BuyListUseCaseType, GettingBuyList {
    let buyGateway: BuyGatewayType
    
    func getBuyList(page: Int) -> Observable<PagingInfo<BuyModel>> {
        return getBuyList(dto: GetPageDto(page: page, perPage: 10, usingCache: false))
    }
}
