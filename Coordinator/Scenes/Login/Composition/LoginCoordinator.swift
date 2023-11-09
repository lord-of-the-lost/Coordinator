//
//  LoginCoordinator.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func didFinishLogin()
}

final class LoginCoordinator: Coordinator {
    var navigation: UINavigationController
    var factory: LoginFactory
    weak var delegate: LoginCoordinatorDelegate?
    
    init(navigation: UINavigationController, 
         factory: LoginFactory,
         delegate: LoginCoordinatorDelegate) {
        self.navigation = navigation
        self.factory = factory
        self.delegate = delegate
    }
    
    func start() {
        let controller = factory.makeLoginViewController(coordinator: self)
        navigation.pushViewController(controller, animated: true)
    }
}

//MARK: - LoginViewControllerCoordinator

extension LoginCoordinator: LoginViewControllerCoordinator {
    func didFinish() {
        delegate?.didFinishLogin()
    }
}
