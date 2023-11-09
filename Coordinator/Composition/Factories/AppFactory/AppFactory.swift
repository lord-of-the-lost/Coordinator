//
//  AppFactory.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import UIKit

struct AppFactory {
    let appDIContainer: AppDIContainer?
    
    func makeLogInCoordinator(navigation: UINavigationController, delegate: LoginCoordinatorDelegate) -> Coordinator {
        let logInFactory = LoginFactory(appDIContainer: appDIContainer)
        return LoginCoordinator(navigation: navigation,
                                factory: logInFactory,
                                delegate: delegate)
    }
    
    func makeTabBarCoordinator(navigation: UINavigationController, delegate: MainTabBarCoordinatorDelegate) -> Coordinator {
        let factory = MainTabBarFactory(appDIContainer: appDIContainer)
        return MainTabBarCoordinator(navigation: navigation, factory: factory, delegate: delegate)
    }
}
