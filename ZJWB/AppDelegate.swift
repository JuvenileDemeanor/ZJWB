//
//  AppDelegate.swift
//  ZJWB
//
//  Created by MAC on 2017/3/27.
//  Copyright © 2017年 pmicro. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        window?.rootViewController = MainViewController()
        
        window?.makeKeyAndVisible()
        
        
        return true
    }



}

// MARK: -自定义LOG
func ZJLog<T>(_ message : T,method : String = #file,function : String = #function,lineNumber : Int = #line){
    
    #if DEBUG
    print("\(method)[\(lineNumber)]:\(message)")
    
    #endif
}


