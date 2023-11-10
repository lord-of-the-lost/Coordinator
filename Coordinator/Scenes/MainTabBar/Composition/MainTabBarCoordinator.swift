//
//  MainTabBarCoordinator.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import UIKit

protocol MainTabBarCoordinatorDelegate: AnyObject {
    func didFinish()
}

final class MainTabBarCoordinator: Coordinator {
    var navigation: UINavigationController
    var childCoordinators: [Coordinator] = []
    private let factory: MainTabBarFactory
    private weak var delegate: MainTabBarCoordinatorDelegate?
    
    init(navigation: UINavigationController,
         factory: MainTabBarFactory,
         delegate: MainTabBarCoordinatorDelegate) {
        self.navigation = navigation
        self.factory = factory
        self.delegate = delegate
    }
    
    func start() {
        let navigationTabBar = factory.makeTabBarController()
        navigation.pushViewController(navigationTabBar, animated: false)
        navigation.navigationBar.isHidden = true
        
        childCoordinators = factory.makeChildCoordinator(settingsDelegate: self)
        let childNavigation = childCoordinators.map { $0.navigation }
        childCoordinators.forEach { $0.start() }
        navigationTabBar.viewControllers = childNavigation
    }
}

extension MainTabBarCoordinator: SettingsCoordinatorDelegate {
    func didTapLogOut() {
        delegate?.didFinish()
    }
}
