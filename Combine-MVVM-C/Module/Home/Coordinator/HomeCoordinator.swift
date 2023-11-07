//
//  HomeCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/7.
//

import UIKit

final class HomeCoordinator: Coordinator {

    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    var startViewController: UIViewController {
        HomeViewController(HomeViewModelImpl(HomeModelImpl()))
    }
}
