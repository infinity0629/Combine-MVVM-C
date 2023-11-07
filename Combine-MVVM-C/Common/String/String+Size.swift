//
//  String+Size.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/11/1.
//

import UIKit

extension String {
    
    public func calculateHeight(fixedWidth: CGFloat, font: UIFont) -> CGFloat {
        let attributedString = NSAttributedString(string: self, attributes: [.font: font])
        let rect = attributedString.boundingRect(with: CGSize(width: fixedWidth, height: 0),
                                                 options: [.usesLineFragmentOrigin, .usesFontLeading],
                                                 context: nil)
        return rect.height
    }
    
    public func calculateWidth(fixedHeight: CGFloat, font: UIFont) -> CGFloat {
        let attributedString = NSAttributedString(string: self, attributes: [.font: font])
        let rect = attributedString.boundingRect(with: CGSize(width: 0, height: fixedHeight),
                                                 options: [.usesLineFragmentOrigin, .usesFontLeading],
                                                 context: nil)
        return rect.width
    }
}
