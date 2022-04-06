//
//  AppDelegate.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        // Override point for customization after application launch.
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: AuthentificationAssembly.createModule())
        window?.makeKeyAndVisible()
        return true
    }
}

