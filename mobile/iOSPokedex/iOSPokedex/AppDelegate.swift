//
//  AppDelegate.swift
//  iOSPokedex
//
//  Created by Thiago Oliveira on 21/12/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        let homeViewController = LaunchScreenViewController()

        window?.rootViewController = homeViewController
        window?.makeKeyAndVisible()

        return true
    }
}
