//
//  LoginCellViewModelImpl.swift
//  MVVMC
//
//  Created by sam on 2023/11/1.
//

import Foundation

final class LoginCellViewModelImpl: LoginCellViewModel {
    
    var title: String {
        entity.title
    }
    
    var placeholder: String {
        entity.placeholder
    }
    
    var tips: String {
        entity.tips
    }
    
    
    var entity: CellDataEntity
    
    init(_ entity: CellDataEntity) {
        self.entity = entity
    }    
}
