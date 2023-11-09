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
    var navigation: UINavigationController
    private var factory: SettingsFactory
    private weak var delegate: SettingsCoordinatorDelegate?
    
    init(navigation: UINavigationController, factory: SettingsFactory, delegate: SettingsCoordinatorDelegate?) {
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

extension SettingsCoordinator: SettingsViewControllerCoordinator {
    func didSelect(settingsViewNavigation: SettingsViewNavigation) {
        switch settingsViewNavigation {
        case .userConfiguration:
            break
        case .account:
            break
        case .theme:
            break
        case .logOut:
            delegate?.didTapLogOut()
        case .noNavigation:
            break
        }
    }
}
