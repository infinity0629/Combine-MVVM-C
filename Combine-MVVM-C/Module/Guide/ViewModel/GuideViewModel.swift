//
//  GuideViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import Foundation
import Combine

class GuideViewModel: ViewModel {
    
    var model: GuideModel
    
    let runAppSubject = PassthroughSubject<Void, Never>()
    
    init(_ model: GuideModel) {
        self.model = model
    }
}
