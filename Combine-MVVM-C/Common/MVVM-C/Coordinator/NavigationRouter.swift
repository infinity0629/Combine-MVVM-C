//
//  NavigationRouter.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/7.
//

import UIKit
import Combine

public final class NavigationRouter {
    
    private let navigationController: UINavigationController
    private let routerRootController: UIViewController?
    private var onEndForViewControllers: [UIViewController: () -> Void] = [:]
    private var subscriptions = Set<AnyCancellable>()
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        routerRootController = navigationController.viewControllers.first
        navigationController.didShowPublisher
            .sink(
                receiveValue: { [weak self] (viewController, animated) in
                    guard let self else { return }
                    guard let endedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(endedViewController) else { return }
                    performOnEnded(for: endedViewController)
                }
            )
            .store(in: &subscriptions)
    }
}

extension NavigationRouter: Router {
    
    public func start(_ viewController: UIViewController, animated: Bool, onEnded: (() -> Void)?) {
        print("from:\(navigationController.viewControllers.last!) ---> to:\(viewController)")
        onEndForViewControllers[viewController] = onEnded
        viewController.hidesBottomBarWhenPushed = true;
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    public func end(animated: Bool) {
        guard let routerRootController else {
            navigationController.popToRootViewController(animated: animated)
            return
        }
        performOnEnded(for: routerRootController)
        navigationController.popToViewController(routerRootController, animated: animated)
    }
}

extension NavigationRouter {
    
    private func performOnEnded(for viewController: UIViewController) {
        guard let onEnded = onEndForViewControllers[viewController] else { return }
        onEnded()
        onEndForViewControllers[viewController] = nil
    }
}
