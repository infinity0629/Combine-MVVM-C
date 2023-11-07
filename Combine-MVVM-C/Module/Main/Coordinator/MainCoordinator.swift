//
//  MainCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit
import Combine

final class MainCoordinator: Coordinator {
    
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    var startViewController: UIViewController {
        mainViewController
    }
    
    private lazy var mainViewController: MainViewController = {
        // MARK: --- Home ---
        let homeViewController = HomeViewController(HomeViewModelImpl(HomeModelImpl()))
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeViewController.viewModel.accountSubject
            .sink(
                receiveValue: { [weak self] in
                    guard let self else { return }
                    let router = ModalNavigationRouter(parentViewController: homeViewController)
                    let coordinator = LoginCoordinator(router: router)
                    startChild(coordinator)
                }
            )
            .store(in: &subscriptions)
        homeViewController.viewModel.settingSubject
            .sink(
                receiveValue: { [weak self] in
                    guard let self else { return }
                    let router = NavigationRouter(navigationController: homeViewController.navigationController!)
                    let coordinator = SettingComponent(router: router)
                    startChild(coordinator)
                }
            )
            .store(in: &subscriptions)
        
        // MARK: --- Product ---
        let productViewController = ProductTableViewController(ProductViewModelImpl())
        productViewController.title = "Product"
        let productNavigationController = UINavigationController(rootViewController: productViewController)
        
        // MARK: --- Account ---
        let accountViewController = AccountViewController(AccountViewModel(AccountModel()))
        let accountNavigationController = UINavigationController(rootViewController: accountViewController)
        accountViewController.viewModel.guideSubject
            .sink(
                receiveValue: {
                    AppDelegate.shared.setCoordinator(.guide)
                }
            )
            .store(in: &subscriptions)
        
        let mainViewController = MainViewController(MainViewModelImpl(MainModelImpl())).then {
            $0.childController.viewControllers =  [homeNavigationController, productNavigationController, accountNavigationController]
        }
        return mainViewController
    }()
}
