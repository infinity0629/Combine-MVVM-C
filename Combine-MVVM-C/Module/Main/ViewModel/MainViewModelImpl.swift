//
//  MainViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import Foundation

class MainViewModelImpl<M: MainModel>: MainViewModel {
    
    var model: M
    
    init(_ model: M) {
        self.model = model
    }
}
