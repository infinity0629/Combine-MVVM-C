//
//  AccountCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/8.
//

import UIKit
import Combine
import Then

final class AccountCoordinator: Coordinator {
    
    var router: Router
    
    init(router: Router) {
        self.router = router
    }

    var startViewController: UIViewController {
        AccountViewController(AccountViewModel(AccountModel())).then {
            $0.viewModel.guideSubject
                .sink(
                    receiveValue: { _ in
                        AppDelegate.shared.setCoordinator(.guide)
                    }
                )
                .store(in: &subscriptions)
        }
    }
}
