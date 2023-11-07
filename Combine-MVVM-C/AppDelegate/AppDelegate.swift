//
//  AppDelegate.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/11/7.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder {
    
    enum RootCoordinator { case guide, main }
    
    static var shared = UIApplication.shared.delegate as! AppDelegate
    
    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    lazy var router = AppDelegateRouter(window: window!)
//    lazy var guideCoordinator = GuideCoordinator(router: router)
//    lazy var mainCoordinator = MainCoordinator(router: router)
}

extension AppDelegate {
    
    func setCoordinator(_ type: RootCoordinator) {
//        switch type {
//        case .guide:
//            guideCoordinator.start()
//        case .main:
//            mainCoordinator.start()
//            UIApplication.alreadyRun()
//        }
    }
}

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        
        setCoordinator(UIApplication.isFirstRun ? .guide: .main)
        
        return true
    }
}
