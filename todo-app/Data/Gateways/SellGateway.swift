//
//  SellGateway.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit
import RxSwift

protocol SellGatewayType {
    func getSells() -> Observable<[SellModel]>
    func add(dto: AddSellDto) -> Observable<Void>
}

struct SellGateway: SellGatewayType, SellRepository {
   
}
