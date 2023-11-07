//
//  ModalNavigationRouter.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/7.
//

import UIKit
import Combine
import CombineCocoa

public final class ModalNavigationRouter {

    private unowned let parentViewController: UIViewController
    private let navigationController = UINavigationController()
    private var onEndForViewControllers: [UIViewController: () -> Void] = [:]
    private var subscriptions = Set<AnyCancellable>()
    
    public init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
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

extension ModalNavigationRouter: Router {
    
    public func start(_ viewController: UIViewController, animated: Bool, onEnded: (() -> Void)?) {
        print("from:\(parentViewController) ---> to:\(viewController)")
        onEndForViewControllers[viewController] = onEnded
        if navigationController.viewControllers.isEmpty {
            presentModally(viewController, animated: animated)
        } else {
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
    
    public func end(animated: Bool) {
        performOnEnded(for: navigationController.viewControllers.first!)
        parentViewController.dismiss(animated: animated, completion: nil)
    }
}

extension ModalNavigationRouter {
    
    private func presentModally(_ viewController: UIViewController, animated: Bool) {
        addDefaultCancelButton(to: viewController)
        navigationController.setViewControllers([viewController], animated: false)
        if #available(iOS 13.0, *) {
            navigationController.modalPresentationStyle = .fullScreen
        }
        parentViewController.present(navigationController, animated: animated, completion: nil)
    }
    
    private func addDefaultCancelButton(to viewController: UIViewController) {
        if let _ = viewController.navigationItem.leftBarButtonItem {
            return
        }
        let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
        leftBarButtonItem.tapPublisher
            .sink(
                receiveValue: { [weak self] in
                    guard let self else { return }
                    end(animated: true)
                }
            )
            .store(in: &subscriptions)
        viewController.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    private func performOnEnded(for viewController: UIViewController) {
        guard let onEnded = onEndForViewControllers[viewController] else { return }
        onEnded()
        onEndForViewControllers[viewController] = nil
    }
}
