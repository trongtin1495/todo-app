//
//  SellListViewModel.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import RxSwift
import RxCocoa
import MGArchitecture

struct SellListViewModel {
    let navigator: SellListNavigatorType
    let useCase: SellListUseCaseType
}

// MARK: - ViewModel
extension SellListViewModel: ViewModel {
    struct Input {
        let load: Driver<Void>
        let reload: Driver<Void>
    }
    
    struct Output {
        @Property var error: Error?
        @Property var isLoading = false
        @Property var isReloading = false
        @Property var sellList = [SellItemViewModel]()
        @Property var isEmpty = false
    }

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        let getListInput = GetListInput(loadTrigger: input.load,
                                        reloadTrigger: input.reload,
                                        getItems: useCase.getSellList)
        
        let getListResult = getList(input: getListInput)
        let (sellList, error, isLoading, isReloading) = getListResult.destructured
        
        error
            .drive(output.$error)
            .disposed(by: disposeBag)
        
        isLoading
            .drive(output.$isLoading)
            .disposed(by: disposeBag)
        
        isReloading
            .drive(output.$isReloading)
            .disposed(by: disposeBag)
        
        sellList
            .map { $0.map(SellItemViewModel.init) }
            .drive(output.$sellList)
            .disposed(by: disposeBag)
        
        checkIfDataIsEmpty(trigger: Driver.merge(isLoading, isReloading),
                           items: sellList)
            .drive(output.$isEmpty)
            .disposed(by: disposeBag)

        return output
    }
}
