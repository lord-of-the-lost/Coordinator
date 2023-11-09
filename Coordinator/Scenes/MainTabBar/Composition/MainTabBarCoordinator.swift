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
    var settingsCoordinator: Coordinator?
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
        
        settingsCoordinator = factory.makeSettingsCoordinator(delegate: self)
        guard let settingsCoordinator else { return }
        navigationTabBar.viewControllers = [settingsCoordinator.navigation]
        settingsCoordinator.start()
    }
}

extension MainTabBarCoordinator: SettingsCoordinatorDelegate {
    func didTapLogOut() {
        delegate?.didFinish()
    }
}
