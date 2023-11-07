//
//  HomeViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import Foundation
import Combine

class HomeViewModelImpl<M: HomeModel>: HomeViewModel {
    
    var model: M
    
    let accountSubject = PassthroughSubject<Void, Never>()
    
    let settingSubject = PassthroughSubject<Void, Never>()
    
    init(_ model: M) {
        self.model = model
    }
}
