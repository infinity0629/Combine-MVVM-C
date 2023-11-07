//
//  UIScreen+Inch.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/9.
//

import UIKit

public protocol AutoScale {
    
    func scale(_ model: DeviceModel) -> Double
}

extension AutoScale {
    
    public func factor(_ model: DeviceModel) -> Double {
        Double(UIScreen.main.bounds.size.width / model.screen.size.width)
    }
}

extension Double: AutoScale {
    
    public func scale(_ model: DeviceModel) -> Double {
        factor(model) * self
    }
}

extension Int: AutoScale {
    
    public func scale(_ model: DeviceModel) -> Double {
        factor(model) * Double(self)
    }
}

extension UIFont {
    
    public static func scale(_ ofSize: Double, _ model: DeviceModel) -> UIFont {
        UIFont.systemFont(ofSize: ofSize.scale(model))
    }
}
