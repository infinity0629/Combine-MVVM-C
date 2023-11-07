//
//  UIApplication+SafeArea.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/31.
//

import UIKit

extension UIApplication {
    
    public static var safeAreaInsetsTop: CGFloat {
        safeAreaInsets.top
    }
    
    public static var safeAreaInsetsBottom: CGFloat {
        safeAreaInsets.bottom
    }
    
    public static var safeAreaInsets: UIEdgeInsets {
        let scene = UIApplication.shared.connectedScenes.first
        guard let windowScene = scene as? UIWindowScene else { return UIEdgeInsets.zero }
        guard let window = windowScene.windows.first else { return UIEdgeInsets.zero }
        return window.safeAreaInsets
    }
}

extension UIApplication {
    
    public static var statusBarHeight: CGFloat {
        let scene = UIApplication.shared.connectedScenes.first
        guard let windowScene = scene as? UIWindowScene else { return 0.0 }
        guard let statusBarManager = windowScene.statusBarManager else { return 0.0 }
        return statusBarManager.statusBarFrame.height
    }
    
    public static var navigationBarHeight: CGFloat {
        44.0
    }
    
    public static var navigationFullHeight: CGFloat {
        statusBarHeight + navigationBarHeight
    }
    
    public static var tabBarHeight: CGFloat {
        49.0
    }
    
    public static var tabBarFullHeight: CGFloat {
        tabBarHeight + safeAreaInsetsBottom
    }
}
