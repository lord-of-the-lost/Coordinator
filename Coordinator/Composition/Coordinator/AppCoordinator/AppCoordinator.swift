//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigation: UINavigationController
    var window: UIWindow?
    var factory: AppFactory?
    var autharization: SessionCheckerAuth?
    private var logInCoordinator: Coordinator?
    
    init(navigation: UINavigationController, window: UIWindow?, factory: AppFactory?, autharization: AuthorizationService?) {
        self.navigation = navigation
        self.window = window
        self.factory = factory
        self.autharization = autharization
    }
    
    func start() {
        configWindow()
        startSomeCoordinator()
    }
    
    private func configWindow() {
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
    
    private func startSomeCoordinator() {
        guard let autharization else { return }
        if autharization.isSessionActive {
            print("show TabBar")
        } else {
            logInCoordinator = factory?.makeLogInCoordinator(navigation: navigation,
                                                                 delegate: self)
            logInCoordinator?.start()
        }
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func didFinishLogin() {
       startSomeCoordinator()
        navigation.viewControllers = []
        logInCoordinator = nil
    }
}
