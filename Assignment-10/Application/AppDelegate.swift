//
//  AppDelegate.swift
//  Assignment-10
//
//  Created by Sailau Almaz Maratuly on 22.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = MainViewController()
        window.makeKeyAndVisible()
        window.backgroundColor = .systemBackground
        self.window = window
        
        return true
    }
}

