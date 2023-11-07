//
//  NiblessView.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/6.
//

import UIKit

open class NiblessView: UIView {

    public init() {
        super.init(frame: .zero)
    }
    
    @available(*, unavailable, message: "Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    }
}
