//
//  AppDelegate.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var appCoordinator: Coordinator?
    var appDIContainer: AppDIContainer?
    var appFactory: AppFactory?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        appDIContainer = AppDIContainer()
        appFactory = AppFactory(appDIContainer: appDIContainer)
        appCoordinator = AppCoordinator(navigation: NavigationImp(rootViewController: UINavigationController()),
                                        window: window,
                                        factory: appFactory,
                                        autharization: appDIContainer?.authorization)
        appCoordinator?.start()
        return true
    }
}

