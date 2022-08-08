//
//  BuyListAssembler.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit

protocol BuyListAssembler {
    func resolve(navigationController: UINavigationController) -> BuyListViewController
    func resolve(navigationController: UINavigationController) -> BuyListViewModel
    func resolve(navigationController: UINavigationController) -> BuyListNavigatorType
    func resolve() -> BuyListUseCaseType
}

extension BuyListAssembler {
    func resolve(navigationController: UINavigationController) -> BuyListViewController {
        let vc = BuyListViewController.instantiate()
        let vm: BuyListViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> BuyListViewModel {
        return BuyListViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension BuyListAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> BuyListNavigatorType {
        return BuyListNavigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> BuyListUseCaseType {
        return BuyListUseCase(buyGateway: resolve())
    }
}
