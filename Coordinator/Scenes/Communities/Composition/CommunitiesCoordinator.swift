//
//  CommunitiesCoordinator.swift
//  Coordinator
//
//  Created by Николай Игнатов on 10.11.2023.
//

import UIKit

final class CommunitiesCoordinator: Coordinator {
    var navigation: UINavigationController
    var factory: CommunitiesFactory
    
    init(navigation: UINavigationController,
         factory: CommunitiesFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeCommunitiesViewController()
        factory.makeItemTabBar(navigation: navigation)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
    }
}
