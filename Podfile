platform :ios, '13.0'

source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'

inhibit_all_warnings!

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        end
    end
end


target 'Combine-MVVM-C' do
    use_frameworks!

    # Combine
    pod 'CombineExt', '~> 1.8.0'
    pod 'CombineCocoa', '~> 0.4.1'
    pod 'CombineDataSources', '~> 0.2.5'
    
    # Network
    pod 'Moya/Combine', '~> 15.0.0'
    pod 'MoyaSugar', '~> 1.3.3'
    pod "SwiftyJSON", '~> 5.0.1'
    
    # Image
    pod 'Kingfisher', '~> 7.9.1'

    # Foundation
    pod 'Then', '~> 3.0.0'
    pod 'R.swift', '~> 7.3.2'
    pod 'CryptoSwift', '~> 1.8.0'
    pod 'KeychainSwift', '~> 20.0'
    pod 'SQLite.swift', '~> 0.14.1'
    pod 'Cache', '~> 6.0.0'
    pod 'SwiftDate', '~> 6.3.1'
    
    # UI
    pod 'SnapKit', '~> 5.6.0'
    pod 'MBProgressHUD', '~> 1.2.0'
    pod 'SwiftMessages', '~> 9.0.8'
    pod 'IQKeyboardManagerSwift', '~> 6.5.16'
    pod 'MJRefresh', '~> 3.7.5'
        
    # Extension
    pod 'SwifterSwift', '~> 6.0.0'
    
end
