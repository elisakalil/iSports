//
//  AppDelegate.swift
//  iSport
//
//  Created by Elisa Kalil on 18/05/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static let sportsViewModel = SportsViewModel.shared
        static let sportsView = SportsView()
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            let sportsViewController = SportsViewController(viewModel: AppDelegate.sportsViewModel, contentView: AppDelegate.sportsView)
            let navigationController = UINavigationController(rootViewController: sportsViewController)
            
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
            
            return true
        }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}

