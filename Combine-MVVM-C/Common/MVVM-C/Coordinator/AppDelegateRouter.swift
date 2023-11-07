//
//  AppDelegateRouter.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/7.
//

import UIKit
import SwifterSwift

public final class AppDelegateRouter {
    
    private let window: UIWindow
    
    public init(window: UIWindow) {
        self.window = window
    }
}

extension AppDelegateRouter: Router {
    
    public func start(_ viewController: UIViewController, animated: Bool, onEnded: (() -> Void)?) {
        window.switchRootViewController(to: viewController, duration: 0.3, options: .transitionCrossDissolve)
        window.makeKeyAndVisible()
    }
    
    public func end(animated: Bool) {}
}
