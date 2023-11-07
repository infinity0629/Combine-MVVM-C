//
//  NiblessTableViewCell.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/28.
//

import UIKit

open class NiblessTableViewCell: UITableViewCell {

    public init() {
        super.init(style: .default, reuseIdentifier: Self.reuseIdentifier)
    }
    
    @available(*, unavailable, message: "Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    }
}
