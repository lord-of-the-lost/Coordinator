//
//  HomeCoordinator.swift
//  Coordinator
//
//  Created by Николай Игнатов on 30.12.2023.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var navigation: UINavigationController
    private let factory: HomeFactory
    
    init(navigation: UINavigationController,
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
    func didTapAddNewPostButton() {
        
    }
    
    func didSelectPost(id: Int) {
        
    }

}
