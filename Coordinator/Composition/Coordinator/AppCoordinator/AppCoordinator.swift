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
    var childCoordinators: [Coordinator] = []
    
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
        let logInCoordinator = factory?.makeLogInCoordinator(navigation: navigation,
                                                             delegate: self)
        addChildCoordinatorStart(logInCoordinator)
    }
    
    private func startMainTabBarCoordinator() {
        let mainTabBarCoordinator = factory?.makeTabBarCoordinator(navigation: navigation,
                                                                   delegate: self)
        addChildCoordinatorStart(mainTabBarCoordinator)
    }
    
    private func clearCoordinatorsAndStart() {
        navigation.viewControllers = []
        clearAllChildCoordinators()
        startSomeCoordinator()
    }
    
}

//MARK: - LoginCoordinatorDelegate

extension AppCoordinator: LoginCoordinatorDelegate {
    func didFinishLogin() {
        clearCoordinatorsAndStart()
    }
}

//MARK: - MainTabBarCoordinatorDelegate

extension AppCoordinator: MainTabBarCoordinatorDelegate {
    func didFinish() {
        clearCoordinatorsAndStart()
    }
}

extension AppCoordinator: ParentCoordinator {}
