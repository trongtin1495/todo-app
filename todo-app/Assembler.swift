//
//  Assembler.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

protocol Assembler: AnyObject,
                    AppAssembler,
                    GatewaysAssembler,
                    HomeAssembler,
                    CallListAssembler,
                    BuyListAssembler,
                    SellListAssembler {
    
}

final class DefaultAssembler: Assembler {
    
}
