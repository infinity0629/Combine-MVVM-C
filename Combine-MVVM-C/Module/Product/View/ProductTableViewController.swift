//
//  ProductTableViewController.swift
//  MVVMC
//
//  Created by sam on 2023/10/9.
//

import UIKit
import SnapKit
import Combine
import CombineCocoa
import Then
                              
final class ProductTableViewController<VM: ProductViewModel>: NiblessViewController, ViewInitializable  {
    
    var viewModel: VM

    init(_ viewModel: VM) {
        self.viewModel = viewModel
        super.init()
        title = viewModel.title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraint()
        setBinding()
    }
    
    func setLayout() {
        view.addSubview(tableView)
        tableView.pullDownRefresh {
            
        }
        tableView.pullUpLoadMore {
            
        }
    }
    
    func setConstraint() {
        tableView.snp.makeConstraints {
            $0.left.right.equalTo(view)
            $0.top.equalTo(view).offset(UIApplication.navigationFullHeight)
            $0.bottom.equalTo(view).offset(-UIApplication.tabBarFullHeight)
        }
    }
    
    func setBinding() {
//        viewModel.cellViewModels
//            .bind(to: tableView.rx.items) { (tableView, row, cellViewModel) in
//                ProductTableViewCell.cellFor(tableView).then {
//                   $0.setContent(with: cellViewModel as! (any ProductCellViewModel))
//                }
//            }
//            .disposed(by: disposeBag)
    }
    
    lazy var tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.contentInsetAdjustmentBehavior = .never
    }
}
