//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigation: UINavigationController
    var window: UIWindow?
    var factory: AppFactory?
    var autharization: SessionCheckerAuth?
    
    init(navigation: UINavigationController, window: UIWindow?, factory: AppFactory?, autharization: AuthorizationService?) {
        self.navigation = navigation
        self.window = window
        self.factory = factory
        self.autharization = autharization
    }
    
    func start() {
        print("start")
    }
    
    
}
