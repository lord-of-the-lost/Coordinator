//
//  HomeCoordinator.swift
//  Coordinator
//
//  Created by Николай Игнатов on 30.12.2023.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var navigation: Navigation
    var childCoordinators: [Coordinator] = []
    private let factory: HomeFactory
    
    init(navigation: Navigation,
         factory: HomeFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeHomeViewController(coordinator: self)
        factory.makeItemTabBar(navigation: navigation)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
    }
}

extension HomeCoordinator: HomeViewControllerCoordinator {
    func didSelectPost(id: Int) {
        let postDetailsCoordinator = factory.makePostDetailsCoordinator(navigation: navigation, id: id, parentCoordinator: self)
        addChildCoordinatorStart(postDetailsCoordinator)
    }
}

extension HomeCoordinator: ParentCoordinator { }
