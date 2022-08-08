//
//  BuyListViewModel.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import RxSwift
import RxCocoa
import MGArchitecture

struct BuyListViewModel {
    let navigator: BuyListNavigatorType
    let useCase: BuyListUseCaseType
}

// MARK: - ViewModel
extension BuyListViewModel: ViewModel {
    struct Input {
        let load: Driver<Void>
        let reload: Driver<Void>
        let loadMore: Driver<Void>
    }
    
    struct Output {
        @Property var error: Error?
        @Property var isLoading = false
        @Property var isReloading = false
        @Property var isLoadingMore = false
        @Property var buyList = [BuyItemViewModel]()
        @Property var isEmpty = false
    }

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        let getPageInput = GetPageInput(loadTrigger: input.load,
                                        reloadTrigger: input.reload,
                                        loadMoreTrigger: input.loadMore,
                                        getItems: useCase.getBuyList(page:))
        
        let getPageResult = getPage(input: getPageInput)
        let (page, pagingError, isLoading, isReloading, isLoadingMore) = getPageResult.destructured
        
        let buyList = page.map { $0.items }
        
        buyList
            .map { $0.map(BuyItemViewModel.init) }
            .drive(output.$buyList)
            .disposed(by: disposeBag)
        
        checkIfDataIsEmpty(trigger: Driver.merge(isLoading, isReloading), items: buyList)
            .drive(output.$isEmpty)
            .disposed(by: disposeBag)
        
        pagingError
            .drive(output.$error)
            .disposed(by: disposeBag)
        
        isLoading
            .drive(output.$isLoading)
            .disposed(by: disposeBag)
        
        isReloading
            .drive(output.$isReloading)
            .disposed(by: disposeBag)
        
        isLoadingMore
            .drive(output.$isLoadingMore)
            .disposed(by: disposeBag)
        
        

        return output
    }
}
