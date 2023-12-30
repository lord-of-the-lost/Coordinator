//
//  ParentCoordinator.swift
//  Coordinator
//
//  Created by Николай Игнатов on 30.12.2023.
//

import Foundation

protocol ParentCoordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
}

extension ParentCoordinator {
    func addChildCoordinatorStart(_ childCoordinator: Coordinator) {
        childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }
    
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }
    
    func clearAllChildCoordinators() {
        childCoordinators = []
    }
}
