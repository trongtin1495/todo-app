//
//  HomeViewController.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa
import MGArchitecture
import Then

final class HomeViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    @IBOutlet weak var callListButton: UIButton!
    @IBOutlet weak var buyListButton: UIButton!
    @IBOutlet weak var sellListButton: UIButton!
    
    // MARK: - Properties
    
    var viewModel: HomeViewModel!
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
        title = "Home"
    }
    
    func bindViewModel() {
        let input = HomeViewModel.Input(
            showCallList: callListButton.rx.tap.asDriver(),
            showBuyList: buyListButton.rx.tap.asDriver(),
            showSellList: sellListButton.rx.tap.asDriver()
        )
        
        _ = viewModel.transform(input, disposeBag: disposeBag)
    }
}

// MARK: - StoryboardSceneBased
extension HomeViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.home
}
