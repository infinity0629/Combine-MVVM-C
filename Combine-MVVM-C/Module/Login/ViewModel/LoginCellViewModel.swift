//
//  LoginCellViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/11/1.
//

import Foundation

protocol LoginCellViewModel: CellViewModel {
    
    var title: String { get }
    var placeholder: String { get }
    var tips: String { get }
}
