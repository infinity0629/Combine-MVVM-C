//
//  UINavigationController+Combine.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/11/7.
//

import Foundation
import UIKit
import Combine
import CombineCocoa

@available(iOS 13.0, *)
extension UINavigationController {
    
    public var willShowPublisher: AnyPublisher<(viewController: UIViewController, animated: Bool), Never> {
        let selector = #selector(UINavigationControllerDelegate.navigationController(_:willShow:animated:))
        return delegateProxy.interceptSelectorPublisher(selector)
            .map { ($0[1] as! UIViewController, $0[2] as! Bool) }
            .eraseToAnyPublisher()
    }

    public var didShowPublisher: AnyPublisher<(viewController: UIViewController, animated: Bool), Never> {
        let selector = #selector(UINavigationControllerDelegate.navigationController(_:didShow:animated:))
        return delegateProxy.interceptSelectorPublisher(selector)
            .map { ($0[1] as! UIViewController, $0[2] as! Bool) }
            .eraseToAnyPublisher()
    }

    private var delegateProxy: DelegateProxy {
        UINavigationControllerDelegateProxy.createDelegateProxy(for: self)
    }
}

@available(iOS 13.0, *)
private class UINavigationControllerDelegateProxy: DelegateProxy, UINavigationControllerDelegate, DelegateProxyType {
    func setDelegate(to object: UINavigationController) {
        object.delegate = self
    }
}
