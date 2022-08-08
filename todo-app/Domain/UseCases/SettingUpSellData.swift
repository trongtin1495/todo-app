//
//  SettingUpSellData.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit
import RxSwift
import RxCocoa

protocol SettingUpSellData {
    var appGateway: AppGatewayType { get }
    var sellGateway: SellGatewayType { get }
}

extension SettingUpSellData {
    func addSellData() -> Observable<Void> {
        return Observable.just(())
            .map { _ in
                self.appGateway.checkFirstRun()
            }
            .flatMapLatest { firstRun -> Driver<Bool> in
                if firstRun {
                    return self.addSells()
                        .asDriverOnErrorJustComplete()
                        .map { _ in firstRun }
                }
                return Driver.just(firstRun)
            }
            .do(onNext: { firstRun in
                if firstRun {
                    self.appGateway.setFirstRun()
                }
            })
            .mapToVoid()
    }
    
    private func addSells() -> Observable<Void> {
        let sells = [
            SellModel(id: 1, name: "iPhone X", price: 150000, quantity: 1, type: 2),
            SellModel(id: 2, name: "TV", price: 38000, quantity: 2, type: 2),
            SellModel(id: 3, name: "Table", price: 12000, quantity: 1, type: 2)
        ]
        
        return sellGateway.add(dto: AddSellDto(sells: sells))
    }
}
