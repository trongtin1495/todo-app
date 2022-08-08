//
//  GettingBuyList.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit
import RxSwift
import MGArchitecture

protocol GettingBuyList {
    var buyGateway: BuyGatewayType { get }
}

extension GettingBuyList {
    func getBuyList(dto: GetPageDto) -> Observable<PagingInfo<BuyModel>> {
        return buyGateway.getBuyList(dto: dto)
    }
}
