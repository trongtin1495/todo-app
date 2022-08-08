//
//  AppUseCase.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import RxSwift

protocol AppUseCaseType {
    func addSellData() -> Observable<Void>
}

struct AppUseCase: AppUseCaseType, SettingUpSellData {
    let appGateway: AppGatewayType
    let sellGateway: SellGatewayType
}
