//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigation: Navigation
    var window: UIWindow?
    var factory: AppFactory?
    var autharization: SessionCheckerAuth?
    private var logInCoordinator: Coordinator?
    private var mainTabBarCoordinator: Coordinator?
    
    init(navigation: Navigation, window: UIWindow?, factory: AppFactory?, autharization: AuthorizationService?) {
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
        window?.rootViewController = navigation.rootViewController
        window?.makeKeyAndVisible()
    }
    
    private func startSomeCoordinator() {
        guard let autharization else { return }
        autharization.isSessionActive ? startMainTabBarCoordinator() : startLoginCoordinator()
    }
    
    private func startLoginCoordinator() {
        logInCoordinator = factory?.makeLogInCoordinator(navigation: navigation,
                                                         delegate: self)
        logInCoordinator?.start()
    }
    
    private func startMainTabBarCoordinator() {
        mainTabBarCoordinator = factory?.makeTabBarCoordinator(navigation: navigation,
                                                               delegate: self)
        mainTabBarCoordinator?.start()
    }
    
}

//MARK: - LoginCoordinatorDelegate

extension AppCoordinator: LoginCoordinatorDelegate {
    func didFinishLogin() {
        navigation.viewControllers = []
        logInCoordinator = nil
        startSomeCoordinator()
    }
}

//MARK: - MainTabBarCoordinatorDelegate

extension AppCoordinator: MainTabBarCoordinatorDelegate {
    func didFinish() {
        navigation.viewControllers = []
        logInCoordinator = nil
        startSomeCoordinator()
    }
}
