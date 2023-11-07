//
//  UITableView+Reusable.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/30.
//

import UIKit

extension UITableViewCell: Reusable {}

public extension UITableViewCell {
    
    static func cellFor(_ tableView: UITableView) -> Self {
        var cell = tableView.dequeueReusableCell(withIdentifier: Self.reuseIdentifier)
        if cell == nil {
            cell = Self.init()
        }
        return cell as! Self
    }
}
