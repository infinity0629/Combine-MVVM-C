//
//  ViewModel.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/11/7.
//

import Foundation
import ObjectiveC.runtime
import Combine

public protocol ViewModel: AnyObject {
    
    var subscriptions: Set<AnyCancellable> { get set }
}

private struct AssociatedSubjectKey {
    static var subscriptions: Int = 0
}

public extension ViewModel {
    
    var subscriptions: Set<AnyCancellable> {
        get {
            guard let subscriptions = objc_getAssociatedObject(self, &AssociatedSubjectKey.subscriptions) else {
                let subscriptions = Set<AnyCancellable>()
                objc_setAssociatedObject(self, &AssociatedSubjectKey.subscriptions, subscriptions, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return subscriptions
            }
            return subscriptions as! Set<AnyCancellable>
        }
        set {
            objc_setAssociatedObject(self, &AssociatedSubjectKey.subscriptions, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
