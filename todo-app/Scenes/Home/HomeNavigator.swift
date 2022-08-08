//
//  HomeNavigator.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit

protocol HomeNavigatorType {
    func toCallList()
    func toBuyList()
    func toSellList()
}

struct HomeNavigator: HomeNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toCallList() {
        let vc: CallListViewController = assembler.resolve(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toBuyList() {
        let vc: BuyListViewController = assembler.resolve(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toSellList() {
        let vc: SellListViewController = assembler.resolve(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: true)
    }
}

