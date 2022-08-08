//
//  BuyListUseCase.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import RxSwift
import MGArchitecture

protocol SellListUseCaseType {
    func getSellList() -> Observable<[SellModel]>
}

struct SellListUseCase: SellListUseCaseType, GettingSellList {
    let sellGatewayType: SellGatewayType
    
    func getSellList() -> Observable<[SellModel]> {
        return getSells()
    }
}
