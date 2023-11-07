//
//  HomeViewModel.swift
//  MVVMC
//
//  Created by sam on 2023/10/23.
//

import Foundation
import Combine

protocol HomeViewModel: ViewModel {
    
    var accountSubject: PassthroughSubject<Void, Never> { get }
    
    var settingSubject: PassthroughSubject<Void, Never> { get }
}
