//
//  GatewaysAssembler.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit

protocol GatewaysAssembler {
    func resolve() -> AppGatewayType
    func resolve() -> CallGatewayType
    func resolve() -> BuyGatewayType
    func resolve() -> SellGatewayType
}

extension GatewaysAssembler where Self: DefaultAssembler {
    func resolve() -> AppGatewayType {
        return AppGateway()
    }
    
    func resolve() -> CallGatewayType {
        return CallGateway()
    }
    
    func resolve() -> BuyGatewayType {
        return BuyGateway()
    }
    
    func resolve() -> SellGatewayType {
        return SellGateway()
    }
}
