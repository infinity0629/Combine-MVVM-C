//
//  Coordinator.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/6.
//

import UIKit
import Combine

public protocol Coordinator: AnyObject {
    
    var router: Router { get }
    var startViewController: UIViewController { get }
    
    init(router: Router)
}

public extension Coordinator {
    
    func start(animated: Bool = true, onEnded: (() -> Void)? = nil) {
        router.start(startViewController, animated: animated, onEnded: onEnded)
    }
    
    func end(animated: Bool = true) {
        router.end(animated: animated)
    }
    
    func startChild(_ child: Coordinator, animated: Bool = true, onEnded: (() -> Void)? = nil) {
        children.append(child)
        child.start(animated: animated) { [weak self, weak child] in
            guard let self, let child else {
                return
            }
            removeChild(child)
            onEnded?()
        }
        print("\(self) start ---- children: \(children)")
    }
    
    private func removeChild(_ child: Coordinator) {
        guard let index = children.firstIndex(where: { $0 === child }) else {
            return
        }
        children.remove(at: index)
        print("\(self) end ------ children: \(children)")
    }
}

private struct AssociatedSubjectKey {
    static var children: Int = 0
    static var subscriptions: Int = 0
}

public extension Coordinator {
    
    var children: [Coordinator] {
        get {
            guard let c = objc_getAssociatedObject(self, &AssociatedSubjectKey.children) else {
                let c =  [Coordinator]()
                objc_setAssociatedObject(self, &AssociatedSubjectKey.children, c, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return c
            }
            return c as! [Coordinator]
        }
        set {
            objc_setAssociatedObject(self, &AssociatedSubjectKey.children, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
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
