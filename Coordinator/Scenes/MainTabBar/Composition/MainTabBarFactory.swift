//
//  MainTabBarFactory.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import UIKit

struct MainTabBarFactory {
    let appDIContainer: AppDIContainer?
    
    func makeTabBarController() -> UITabBarController {
        let tabBar = MainTabBarController()
        tabBar.viewControllers = []
        tabBar.title = "Main"
        return tabBar
    }
    
    func makeSettingsCoordinator(delegate: SettingsCoordinatorDelegate) -> Coordinator {
        let factory = SettingsFactory(appDIContainer: appDIContainer)
        let navigation = UINavigationController()
        return SettingsCoordinator(navigation: navigation, factory: factory, delegate: delegate)
    }
}
