//
//  SettingComponent.swift
//  MVVMC
//
//  Created by sam on 2023/10/8.
//

import UIKit

final class SettingComponent: Coordinator {

    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    var startViewController: UIViewController {
        SettingViewController(SettingViewModel(SettingModel()))
    }
}
