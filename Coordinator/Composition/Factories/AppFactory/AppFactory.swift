//
//  AppFactory.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import UIKit

struct AppFactory {
    let appDIContainer: AppDIContainer?
    
    func makeLogInCoordinator(navigation: UINavigationController, delegate: LoginCoordinatorDelegate) -> LoginCoordinator {
        let logInFactory = LoginFactory(appDIContainer: appDIContainer)
        let coordinator = LoginCoordinator(navigation: navigation,
                                           factory: logInFactory,
                                           delegate: delegate)
        return coordinator
    }
}
