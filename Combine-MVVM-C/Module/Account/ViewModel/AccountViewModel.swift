//
//  AccountViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/8.
//

import Foundation
import Combine

class AccountViewModel: ViewModel {
    
    var model: AccountModel
    
    let guideSubject = PassthroughSubject<Void, Never>()
    
    init(_ model: AccountModel) {
        self.model = model
    }
}

