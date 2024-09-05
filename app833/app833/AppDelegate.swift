//
//  AppDelegate.swift
//  app833
//
//  Created by Dias Atudinov on 05.09.2024.
//

import UIKit
import ApphudSDK
import OneSignalFramework

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: Info().appHudID)

        OneSignal.initialize(Info().oneSignal, withLaunchOptions: launchOptions)
        OneSignal.login(Apphud.userID())
        
        print("AppDelegate: didFinishLaunchingWithOptions")
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Handle app entering background
        print("AppDelegate: applicationDidEnterBackground")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Handle app entering foreground
        print("AppDelegate: applicationWillEnterForeground")
    }
    
    // Implement other UIApplicationDelegate methods as needed
}
