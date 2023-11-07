//
//  Reusable.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/29.
//

import UIKit

public protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension Reusable where Self: UIView {
    
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
