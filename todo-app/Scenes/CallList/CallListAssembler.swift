//
//  CallListAssembler.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit

protocol CallListAssembler {
    func resolve(navigationController: UINavigationController) -> CallListViewController
    func resolve(navigationController: UINavigationController) -> CallListViewModel
    func resolve(navigationController: UINavigationController) -> CallListNavigatorType
    func resolve() -> CallListUseCaseType
}

extension CallListAssembler {
    func resolve(navigationController: UINavigationController) -> CallListViewController {
        let vc = CallListViewController.instantiate()
        let vm: CallListViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> CallListViewModel {
        return CallListViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension CallListAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> CallListNavigatorType {
        return CallListNavigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> CallListUseCaseType {
        return CallListUseCase(callGateway: resolve())
    }
}
