//
//  SettingViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/8.
//

import UIKit

final class SettingViewController: NiblessViewController, ViewInitializable {
    
    var viewModel: SettingViewModel
    
    init(_ viewModel: SettingViewModel) {
        self.viewModel = viewModel
        super.init()
        title = "Setting"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
