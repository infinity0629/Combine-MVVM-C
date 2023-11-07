//
//  UIApplicationExtensions.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/25.
//

import UIKit
import SwifterSwift
import Then

fileprivate enum UserDefaultsKeys: String {
    case appVersion
}

extension UIApplication {
    
    public static var isFirstRun: Bool {
        guard let currentVersion = UIApplication.shared.version else { return true }
        guard let oldVersion = UserDefaults.standard.value(forKey: UserDefaultsKeys.appVersion.rawValue) else { return true }
        return oldVersion as! String != currentVersion
    }
    
    public static func alreadyRun() {
        guard let currentVersion = UIApplication.shared.version else { return }
        UserDefaults.standard.do {
            $0.set(currentVersion, forKey: UserDefaultsKeys.appVersion.rawValue)
            $0.synchronize()
        }
    }
}
