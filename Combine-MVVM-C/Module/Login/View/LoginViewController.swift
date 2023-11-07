//
//  LoginViewController.swift
//  MVVMC
//
//  Created by sam on 2023/11/1.
//

import UIKit
//import RxSwift
//import RxCocoa
import Then

final class LoginViewController<VM: LoginViewModel>: NiblessViewController, ViewInitializable {
    
    var viewModel: VM
    
    init(_ viewModel: VM) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraint()
        setBinding()
    }
    
    private func setLayout() {
        
        title = "Login"
        
        view.backgroundColor = .white
        
        tableView.rowHeight = 80.scale(.iPhone_6s)
        tableView.tableFooterView = loginButton
        view.addSubview(tableView)
    }
    
    private func setConstraint() {
        tableView.snp.makeConstraints {
            $0.left.right.equalTo(view)
            $0.top.equalTo(view).offset(UIApplication.navigationFullHeight)
            $0.bottom.equalTo(view).offset(-UIApplication.tabBarFullHeight)
        }
    }
    
    private func setBinding() {
        
//        var accountValid: Observable<Bool> = .empty()
//        var passwordValid: Observable<Bool> = .empty()
//        
//        viewModel.cellViewModels
//            .bind(to: tableView.rx.items) { [weak self] (tableView, row, cellViewModel) in
//                
//                let cell = LoginCell.cellFor(tableView)
//                
//                guard let self else { return cell }
//                
//                switch row {
//                case CellType.account.rawValue:
//                    
//                    accountValid = cell.inputTextField.rx.text.orEmpty
//                        .map { $0.count >= 5 }
//                        .share(replay: 1)
//                    
//                    accountValid
//                        .skip(1)
//                        .bind(to: cell.tipsLabel.rx.isHidden)
//                        .disposed(by: cell.disposeBag)
//                    
//                case CellType.password.rawValue:
//                    
//                    passwordValid = cell.inputTextField.rx.text.orEmpty
//                        .map { $0.count >= 5 }
//                        .share(replay: 1)
//                    
//                    passwordValid
//                        .skip(1)
//                        .bind(to: cell.tipsLabel.rx.isHidden)
//                        .disposed(by: cell.disposeBag)
//                    
//                default:
//                    break
//                }
//                
//                Observable.combineLatest(accountValid, passwordValid) { $0 && $1 }
//                    .share(replay: 1)
//                    .bind(to: loginButton.rx.isEnabled)
//                    .disposed(by: cell.disposeBag)
//                
//                cell.setContent(with: cellViewModel as! (any LoginCellViewModel))
//                
//                return cell
//            }
//            .disposed(by: disposeBag)
        
        
        
    }
    
    lazy var tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
        $0.contentInsetAdjustmentBehavior = .never
        $0.separatorColor = .clear
        $0.separatorStyle = .none
    }
    
    lazy var loginButton = UIButton().then {
        $0.frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 80)
        $0.setBackgroundImage(UIImage.color(.orange), for: .normal)
        $0.setBackgroundImage(UIImage.color(.lightGray), for: .disabled)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.scale(20.0, .iPhone_6s)
        $0.setTitle("登录", for: .normal)
    }
}
