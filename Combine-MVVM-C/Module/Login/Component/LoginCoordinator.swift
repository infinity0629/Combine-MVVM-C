//
//  LoginCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/11/1.
//

import UIKit

final class LoginCoordinator: Coordinator {
    
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    var startViewController: UIViewController {
        LoginViewController(LoginViewModelImpl())
    }
}
