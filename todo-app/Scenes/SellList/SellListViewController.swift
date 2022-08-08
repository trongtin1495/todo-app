//
//  SellListViewController.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit
import Reusable
import SDWebImage
import RxSwift
import RxCocoa
import MGArchitecture
import MGLoadMore

final class SellListViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: PagingTableView!
    
    // MARK: - Properties

    var viewModel: SellListViewModel!
    var disposeBag = DisposeBag()
    
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
        title = "Sell List"
        
        tableView.do {
            $0.register(cellType: SellCell.self)
            $0.rowHeight = UITableView.automaticDimension
            $0.refreshFooter = nil
            $0.removeRefreshControl()
        }
    }
    
    func bindViewModel() {
        let input = SellListViewModel.Input(
            load: Driver.just(()),
            reload: tableView.refreshTrigger
        )
        
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.$sellList
            .asDriver()
            .drive(tableView.rx.items) { tableView, index, sell in
                return tableView.dequeueReusableCell(
                    for: IndexPath(row: index, section: 0),
                    cellType: SellCell.self
                )
                .then {
                    $0.bindViewModel(sell)
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
        
        output.$isEmpty
            .asDriver()
            .drive()
            .disposed(by: disposeBag)
    }
}

// MARK: - StoryboardSceneBased
extension SellListViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.sellList
}
