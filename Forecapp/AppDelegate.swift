//
//  AppDelegate.swift
//  Forecapp
//
//  Created by thunderduck on 30/07/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationCon = UINavigationController.init()
        appCoordinator = AppCoordinator(navCon: navigationCon)
        appCoordinator!.start()
        
        window!.rootViewController = navigationCon
        window!.makeKeyAndVisible()
        return true
    }

    

}
