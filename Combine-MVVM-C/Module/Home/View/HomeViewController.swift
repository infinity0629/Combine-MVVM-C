//
//  HomeViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/6.
//

import UIKit
import Combine
import CombineCocoa

final class HomeViewController<VM: HomeViewModel>: NiblessViewController, ViewInitializable {
    
    var viewModel: VM
    
    init(_ viewModel: VM) {
        self.viewModel = viewModel
        super.init()
        title = "Home"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let leftBarButtonItem = UIBarButtonItem(title: "Login", style: .plain, target: nil, action: nil)
        leftBarButtonItem.tapPublisher
            .sink(
                receiveValue: { [weak self] _ in
                    guard let self else { return }
                    viewModel.accountSubject.send()
                }
            )
            .store(in: &subscriptions)
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: nil, action: nil)
        rightBarButtonItem.tapPublisher
            .sink(
                receiveValue: { [weak self] _ in
                    guard let self else { return }
                    viewModel.settingSubject.send()
                }
            )
            .store(in: &subscriptions)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
}
