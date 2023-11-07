//
//  DeviceModel.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/10.
//

import UIKit

public typealias ScreenType = (inch: Double, size: CGSize)

public enum DeviceModel {
    case iPhone_SE_1, iPhone_SE_2, iPhone_SE_3
    case iPhone_5, iPhone_5s, iPhone_5c
    case iPhone_6, iPhone_6_Plus, iPhone_6s, iPhone_6s_Plus
    case iPhone_7, iPhone_7_Plus
    case iPhone_8, iPhone_8_Plus
    case iPhone_Xr, iPhone_X, iPhone_Xs, iPhone_Xs_Max
    case iPhone_11, iPhone_11_Pro, iPhone_11_Pro_Max
    case iPhone_12_mini, iPhone_12, iPhone_12_Pro, iPhone_12_Pro_Max
    case iPhone_13_mini, iPhone_13, iPhone_13_Pro, iPhone_13_Pro_Max
    case iPhone_14, iPhone_14_Plus, iPhone_14_Pro, iPhone_14_Pro_Max
    case iPhone_15, iPhone_15_Plus, iPhone_15_Pro, iPhone_15_Pro_Max
}

extension DeviceModel {
    
    public var screen: ScreenType {
        switch self {
        case 
                .iPhone_5,
                .iPhone_5s,
                .iPhone_5c,
                .iPhone_SE_1:
            
            return (inch: 4.0, size: CGSize(width: 320.0, height: 568.0))
            
        case
                .iPhone_6,
                .iPhone_6s,
                .iPhone_7,
                .iPhone_8,
                .iPhone_SE_2,
                .iPhone_SE_3:
            
            return (inch: 4.7, size: CGSize(width: 375.0, height: 667.0))
            
        case 
                .iPhone_6_Plus,
                .iPhone_6s_Plus,
                .iPhone_7_Plus,
                .iPhone_8_Plus:
            
            return (inch: 5.5, size: CGSize(width: 414.0, height: 736.0))
            
        case 
                .iPhone_X,
                .iPhone_Xs,
                .iPhone_11_Pro:
            
            return (inch: 5.8, size: CGSize(width: 375.0, height: 812.0))
            
        case 
                .iPhone_Xs_Max,
                .iPhone_11_Pro_Max:
            
            return (inch: 6.5, size: CGSize(width: 414.0, height: 896.0))
            
        case 
                .iPhone_Xr,
                .iPhone_11:
            
            return (inch: 6.1, size: CGSize(width: 414.0, height: 896.0))
            
        case 
                .iPhone_12_mini,
                .iPhone_13_mini:
            
            return (inch: 5.4, size: CGSize(width: 375.0, height: 812.0))
            
        case 
                .iPhone_12,
                .iPhone_12_Pro,
                .iPhone_13,
                .iPhone_13_Pro,
                .iPhone_14:
            
            return (inch: 6.1, size: CGSize(width: 390.0, height: 844.0))
            
        case 
                .iPhone_14_Pro,
                .iPhone_15,
                .iPhone_15_Pro:
            
            return (inch: 6.1, size: CGSize(width: 393.0, height: 852.0))
            
        case 
                .iPhone_12_Pro_Max,
                .iPhone_13_Pro_Max,
                .iPhone_14_Plus:
            
            return (inch: 6.7, size: CGSize(width: 428.0, height: 926.0))
            
        case 
                .iPhone_14_Pro_Max,
                .iPhone_15_Plus,
                .iPhone_15_Pro_Max:
            
            return (inch: 6.7, size: CGSize(width: 430.0, height: 932.0))
        }
    }
}

extension DeviceModel: CustomStringConvertible {
    
    public var description: String {
        "width:\(screen.size.width) height:\(screen.size.height) inch:\(screen.inch)"
    }
}
