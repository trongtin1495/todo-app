//
//  HomeViewModel.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import RxSwift
import RxCocoa
import MGArchitecture

struct HomeViewModel {
    let navigator: HomeNavigatorType
    let useCase: HomeUseCaseType
}

// MARK: - ViewModel
extension HomeViewModel: ViewModel {
    struct Input {
        let showCallList: Driver<Void>
        let showBuyList: Driver<Void>
        let showSellList: Driver<Void>
    }
    
    struct Output {
        @Property var menuList = [Menu]()
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        input.showCallList
            .do(onNext: navigator.toCallList)
            .drive()
            .disposed(by: disposeBag)
                
        input.showBuyList
            .do(onNext: navigator.toBuyList)
            .drive()
            .disposed(by: disposeBag)
                    
        input.showSellList
            .do(onNext: navigator.toSellList)
            .drive()
            .disposed(by: disposeBag)
            
        return output
    }
    
    func menuList() -> [Menu] {
        return Menu.allCases
    }
}

extension HomeViewModel {
    enum Menu: Int, CustomStringConvertible, CaseIterable {
        case callList
        case buyList
        case sellList
        
        var description: String {
            switch self {
            case .callList:
                return "Call List"
            case .buyList:
                return "Buy List"
            case .sellList:
                return "Sell List"
            }
        }
    }
}
