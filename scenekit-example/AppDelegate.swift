//
//  AppDelegate.swift
//  scenekit-example
//
//  Created by Андрей Груненков on 05.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let rootVC = ViewController()
        rootVC.view.backgroundColor = .white
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        return true
    }

}

