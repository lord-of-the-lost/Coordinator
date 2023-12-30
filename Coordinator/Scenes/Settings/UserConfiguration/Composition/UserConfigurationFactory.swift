//
//  UserConfigurationFactory.swift
//  Coordinator
//
//  Created by Николай Игнатов on 30.12.2023.
//

import UIKit

struct UserConfigurationFactory {
    func makeUserConfigurationViewController(coordinator: UserConfigurationViewControllerCoordinator) -> UIViewController {
        let userConfigurationViewController = UserConfigurationViewController(coordinator: coordinator)
        userConfigurationViewController.title = "User Configuration"
        return userConfigurationViewController
    }
    
    func makeAvatarViewController() -> UIViewController {
        let exampleViewController = ExampleViewController()
        exampleViewController.title = "Make your avatar"
        return exampleViewController
    }
}
