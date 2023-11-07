//
//  ListViewModel.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/11/7.
//

import Foundation
import Combine
import CombineExt

public protocol ListViewModel: ViewModel {
    
    associatedtype CVM
    
    var cellViewModels: CurrentValueRelay<[CVM]> { get }
}

