//
//  MyPostCoordinator.swift
//  Coordinator
//
//  Created by Николай Игнатов on 10.11.2023.
//

import UIKit

final class MyPostCoordinator: Coordinator {
    var navigation: UINavigationController
    private let factory: MyPostFactory
    private let mediator: MyPostMediator
    
    init(navigation: UINavigationController,
         factory: MyPostFactory,
         medeiator: MyPostMediator ) {
        self.navigation = navigation
        self.factory = factory
        self.mediator = medeiator
    }
    
    func start() {
        let controller = factory.makeMyPostViewController(coordinator: self)
        factory.makeItemTabBar(navigation: navigation)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
    }
}

extension MyPostCoordinator: MyPostsViewControllerCoordinator {
    func didSelectPost(id: Int) {
        
    }
    
    func didTapAddNewPostButton() {
        let controller = factory.makeNewPostViewController(coordinator: self)
        navigation.present(controller, animated: true)
    }
}

extension MyPostCoordinator: NewPostViewControllerCoordinator {
    func didSaveNewPost(title: String) {
        navigation.dismiss(animated: true)
        mediator.updateController(title: title, navigation: navigation)
    }
}
