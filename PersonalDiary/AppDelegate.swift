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
        guard #available(iOS 13.0, *) else {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = UINavigationController(rootViewController: AuthentificationAssembly.createModule())
            window?.makeKeyAndVisible()
            return true
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

