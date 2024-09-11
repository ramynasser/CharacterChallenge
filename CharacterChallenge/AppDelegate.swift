//
//  AppDelegate.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 11/09/2024.
//

import UIKit
import Logger
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    static var shared: AppDelegate!
    var window:UIWindow?
    
    var appConfig: AppConfig = {
        guard let appConfig = AppConfig() else {
            let errorMessage = "Invalid app config"
            LogsManager.shared.critical(message: errorMessage, error: nil)
            fatalError(errorMessage)
        }
        
        return appConfig
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Set the initial view controller
        let initialViewController = CharactersListViewController()
        let navigationController = UINavigationController(rootViewController: initialViewController)
        window?.rootViewController = navigationController
        
        // Make the window visible
        window?.makeKeyAndVisible()

        Self.shared = self
        setup()
        return true
    }
    
    func setup() {
         _ = [
             DataConfigurator.shared,
             LoggerConfigurator.shared,
             DesignSystemConfigurator.shared
         ].map { $0.setup() }
     }
    
}

