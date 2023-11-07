//
//  LoginCell.swift
//  MVVMC
//
//  Created by sam on 2023/11/1.
//

import UIKit
import SnapKit
import Then
//import RxSwift
//import RxCocoa

final class LoginCell: NiblessTableViewCell, Cell {
    
    override init() {
        super.init()
        setLayout()
        setConstraint()
        setBinding()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        disposeBag = DisposeBag()
    }
    
    private func setLayout() {
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(inputTextField)
        contentView.addSubview(tipsLabel)
    }
    
    private func setConstraint() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(8.scale(.iPhone_6s))
            $0.left.equalTo(contentView).offset(10.scale(.iPhone_6s))
            $0.right.equalTo(contentView).offset(-10.scale(.iPhone_6s))
        }
        
        inputTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(3.scale(.iPhone_6s))
            $0.left.right.equalTo(titleLabel)
        }
        
        tipsLabel.snp.makeConstraints {
            $0.top.equalTo(inputTextField.snp.bottom).offset(3.scale(.iPhone_6s))
            $0.left.right.equalTo(inputTextField)
        }
    }
    
    private func setBinding() {
        
    }
    
    func setContent(with viewModel: any LoginCellViewModel) {
        titleLabel.text = viewModel.title
        inputTextField.placeholder = viewModel.placeholder
        tipsLabel.text = viewModel.tips
    }
    
    lazy var titleLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 15.scale(.iPhone_6s))
    }
    
    lazy var inputTextField = UITextField().then {
        $0.backgroundColor = .clear
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.font = .systemFont(ofSize: 15.scale(.iPhone_6s))
        $0.clearButtonMode = .whileEditing
        $0.borderStyle = .bezel
    }
    
    lazy var tipsLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .red
        $0.font = .systemFont(ofSize: 13.scale(.iPhone_6s))
        $0.isHidden = true
    }
}
