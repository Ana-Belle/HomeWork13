//
//  AppDelegate.swift
//  HomeWork13
//
//  Created by Anastasia Belyakova on 10.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = setTabBarController()
        window?.makeKeyAndVisible()

        return true
    }

}
