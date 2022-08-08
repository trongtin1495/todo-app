//
//  AddSellDto.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import Dto
import RxSwift
import ValidatedPropertyKit

struct AddSellDto: Dto {
    @Validated(Validation.nonEmpty)
    var sells: [SellModel]?
    
    var validatedProperties: [ValidatedProperty] {
        return [_sells]
    }
    
    init(sells: [SellModel]) {
        self.sells = sells
    }
}

protocol AddingSells {
    var sellGatewayType: SellGatewayType { get }
}

extension AddingSells {
    func add(dto: AddSellDto) -> Observable<Void> {
        if let error = dto.validationError {
            return Observable.error(error)
        }
        
        return sellGatewayType.add(dto: dto)
    }
}
