//
//  LoginFactory.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import UIKit

struct LoginFactory {
    let appDIContainer: AppDIContainer?
    
    func makeLoginViewController(coordinator: LoginViewControllerCoordinator?) -> UIViewController {
        LoginViewController(coordinator: coordinator,
                            viewModel: LoginViewModel(authorization: appDIContainer?.authorization))
    }
}
