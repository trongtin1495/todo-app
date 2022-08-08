//
//  SellListAssembler.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit

protocol SellListAssembler {
    func resolve(navigationController: UINavigationController) -> SellListViewController
    func resolve(navigationController: UINavigationController) -> SellListViewModel
    func resolve(navigationController: UINavigationController) -> SellListNavigatorType
    func resolve() -> SellListUseCaseType
}

extension SellListAssembler {
    func resolve(navigationController: UINavigationController) -> SellListViewController {
        let vc = SellListViewController.instantiate()
        let vm: SellListViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> SellListViewModel {
        return SellListViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension SellListAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> SellListNavigatorType {
        return SellListNavigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> SellListUseCaseType {
        return SellListUseCase(sellGatewayType: resolve())
    }
}
