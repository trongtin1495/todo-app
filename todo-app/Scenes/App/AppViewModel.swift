//
//  AppViewModel.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import MGArchitecture
import RxSwift
import RxCocoa

struct AppViewModel {
    let navigator: AppNavigatorType
    let useCase: AppUseCaseType
}

// MARK: - ViewModel
extension AppViewModel: ViewModel {
    struct Input {
        let load: Driver<Void>
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        input.load
            .flatMapLatest {
                self.useCase.addSellData()
                    .asDriverOnErrorJustComplete()
            }
            .drive(onNext: self.navigator.toMain)
            .disposed(by: disposeBag)
        
        return Output()
    }
}
