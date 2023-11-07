//
//  GuideCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit
import Combine

final class GuideCoordinator: Coordinator {
    
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    var startViewController: UIViewController {
        GuideViewController(GuideViewModel(GuideModel())).then {
            $0.viewModel.runAppSubject
                .sink(
                    receiveValue: { _ in
                        AppDelegate.shared.setCoordinator(.main)
                    }
                )
                .store(in: &subscriptions)
        }
    }
}
