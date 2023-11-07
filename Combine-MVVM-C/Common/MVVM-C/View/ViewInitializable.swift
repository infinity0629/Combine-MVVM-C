//
//  ViewInitializable.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/11/7.
//

import Foundation

public protocol ViewInitializable: View {
    
    init(_ viewModel: VM)
}
