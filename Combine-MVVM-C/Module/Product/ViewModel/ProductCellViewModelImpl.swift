//
//  ProductCellViewModelImpl.swift
//  MVVMC
//
//  Created by sam on 2023/10/29.
//

import Foundation

final class ProductCellViewModelImpl: ProductCellViewModel {
    
    var title: String = "Product Cell"
    
    var entity: ProductEntity
    
    init(_ entity: ProductEntity) {
        self.entity = entity
    }
}
