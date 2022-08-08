//
//  BuyListNavigator.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit

protocol BuyListNavigatorType {
    
}

struct BuyListNavigator: BuyListNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}

