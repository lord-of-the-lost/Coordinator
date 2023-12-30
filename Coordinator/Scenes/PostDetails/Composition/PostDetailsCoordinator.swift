//
//  PostDetailsCoordinator.swift
//  Coordinator
//
//  Created by Николай Игнатов on 30.12.2023.
//

import UIKit

final class PostDetailsCoordinator: Coordinator {
    var navigation: Navigation
    private let factory: PostDetailsFactory
    private weak var parentCoordinator: ParentCoordinator?
    
    init(navigation: Navigation,
         factory: PostDetailsFactory,
         parentCoordinator: ParentCoordinator?) {
        self.navigation = navigation
        self.factory = factory
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let controller = factory.makePostDetailsViewController(coordinator: self)
        navigation.pushViewController(controller, animated: true) { [weak self] in
            guard let self else { return }
            self.parentCoordinator?.removeChildCoordinator(self)
        }
    }
}

extension PostDetailsCoordinator: PostDetailsViewControllerCoordinator {
    func didTapPhotosButton() {
        navigation.present(factory.makePhotosViewController(), animated: true)
    }
    
    func didTapMoreDetailsButton() {
        navigation.present(factory.makeMoreDetailsViewController(), animated: true)
    }
    
    func didTapSourceButton() {
        navigation.present(factory.makeSourceViewController(), animated: true)
    }
}
