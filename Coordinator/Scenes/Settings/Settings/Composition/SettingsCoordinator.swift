//
//  SettingsCoordinator.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import UIKit

protocol SettingsCoordinatorDelegate: AnyObject {
    func didTapLogOut()
}

final class SettingsCoordinator: Coordinator {
    var navigation: Navigation
    var factory: SettingsFactory
    weak var delegate: SettingsCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    
    init(navigation: Navigation, factory: SettingsFactory, delegate: SettingsCoordinatorDelegate?) {
        self.navigation = navigation
        self.factory = factory
        self.delegate = delegate
    }
    
    func start() {
        let controller = factory.makeSettingsController(coordinator: self)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
        factory.makeItemTabBar(navigation: navigation)
    }
}
extension SettingsCoordinator: ParentCoordinator { }
    
extension SettingsCoordinator: SettingsViewControllerCoordinator {
    func didSelect(settingsViewNavigation: SettingsViewNavigation) {
        switch settingsViewNavigation {
        case .userConfiguration:
            callConfigurationCoordinator()
        case .account:
            navigation.pushViewController(factory.makeAccountViewController(), animated: true)
        case .theme:
            navigation.pushViewController(factory.makeThemeViewController(), animated: true)
        case .logOut:
            delegate?.didTapLogOut()
        case .noNavigation:
            break
        }
    }
    
    private func callConfigurationCoordinator() {
       let userConfigurationCoordinator = factory.makeUserConfigurationCoordinator(delegate: self)
        addChildCoordinatorStart(userConfigurationCoordinator)
        navigation.present(userConfigurationCoordinator.navigation.rootViewController, animated: true)
        userConfigurationCoordinator.navigation.dissmissNavigation = { [weak self] in
            self?.removeChildCoordinator(userConfigurationCoordinator)
        }
    }
}

extension SettingsCoordinator: UserConfigurationCoordinatorDelegate {
    func didFinish(childCoordinator: Coordinator) {
        childCoordinator.navigation.dissmissNavigation = nil
        removeChildCoordinator(childCoordinator)
        navigation.dismiss(animated: true)
    }
}
