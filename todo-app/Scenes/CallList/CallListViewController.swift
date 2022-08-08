//
//  CallListViewController.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa
import MGArchitecture
import MGLoadMore

final class CallListViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: PagingTableView!
    
    // MARK: - Properties

    var viewModel: CallListViewModel!
    var disposeBag = DisposeBag()
    
    private var callList = [CallItemViewModel]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    deinit {
        logDeinit()
    }
    
    // MARK: - Methods
    
    private func configView() {
        title = "Call List"
        
        tableView.do {
            $0.register(cellType: CallCell.self)
            $0.rowHeight = UITableView.automaticDimension
        }
    }
    
    func bindViewModel() {
        let input = CallListViewModel.Input(
            load: Driver.just(()),
            reload: tableView.refreshTrigger,
            loadMore: tableView.loadMoreTrigger
        )
        
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.$callList
            .asDriver()
            .do(onNext: { [unowned self] callList in
                self.callList = callList
            })
            .drive(tableView.rx.items) { tableView, index, call in
                return tableView.dequeueReusableCell(
                    for: IndexPath(row: index, section: 0),
                    cellType: CallCell.self
                )
                .then {
                    $0.bindViewModel(call)
                }
            }
            .disposed(by: disposeBag)
        
        output.$error
            .asDriver()
            .unwrap()
            .drive(rx.error)
            .disposed(by: disposeBag)
        
        output.$isLoading
            .asDriver()
            .drive(rx.isLoading)
            .disposed(by: disposeBag)
        
        output.$isReloading
            .asDriver()
            .drive(tableView.isRefreshing)
            .disposed(by: disposeBag)
        
        output.$isLoadingMore
            .asDriver()
            .drive(tableView.isLoadingMore)
            .disposed(by: disposeBag)
        
        output.$isEmpty
            .asDriver()
            .drive(tableView.isEmpty)
            .disposed(by: disposeBag)
    }
}

// MARK: - StoryboardSceneBased
extension CallListViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.callList
}
