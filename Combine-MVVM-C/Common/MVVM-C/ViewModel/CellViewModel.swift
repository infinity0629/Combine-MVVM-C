//
//  CellViewModel.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/11/7.
//

import Foundation

public protocol CellViewModel {
    
    associatedtype E
    
    var entity: E { get }
    
    init(_ entity: E)
}
