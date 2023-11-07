//
//  ProductCoordinator.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit

final class ProductCoordinator: Coordinator {
    
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    var startViewController: UIViewController {
        ProductTableViewController(ProductViewModelImpl())
    }
}
