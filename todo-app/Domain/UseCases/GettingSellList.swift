//
//  GettingSellList.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import RxSwift

protocol GettingSellList {
    var sellGatewayType: SellGatewayType { get }
}

extension GettingSellList {
    func getSells() -> Observable<[SellModel]> {
        return sellGatewayType.getSells()
    }
}
