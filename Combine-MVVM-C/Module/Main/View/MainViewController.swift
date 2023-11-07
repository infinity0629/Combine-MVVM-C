//
//  MainViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit
import SwifterSwift

class MainViewController<VM: MainViewModel>: NiblessViewController, ViewInitializable  {
    
    var viewModel: VM
    
    private(set) lazy var childController = UITabBarController()
    
    required init(_ viewModel: VM) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Main"
        setupLayout()
    }
    
    private func setupLayout() {
        addChildViewController(childController, toContainerView: view)
    }
}
