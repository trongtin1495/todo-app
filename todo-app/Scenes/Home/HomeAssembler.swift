//
//  HomeAssembler.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit

protocol HomeAssembler {
    func resolve(navigationController: UINavigationController) -> HomeViewController
    func resolve(navigationController: UINavigationController) -> HomeViewModel
    func resolve(navigationController: UINavigationController) -> HomeNavigatorType
    func resolve() -> HomeUseCaseType
}

extension HomeAssembler {
    func resolve(navigationController: UINavigationController) -> HomeViewController {
        let vc = HomeViewController.instantiate()
        let vm: HomeViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> HomeViewModel {
        return HomeViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension HomeAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> HomeNavigatorType {
        return HomeNavigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> HomeUseCaseType {
        return HomeUseCase()
    }
}
