//
//  MainTabBarFactory.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import UIKit

struct MainTabBarFactory {
    let appDIContainer: AppDIContainer?
    
    func makeTabBarController() -> UITabBarController {
        let tabBar = MainTabBarController()
        tabBar.viewControllers = []
        tabBar.title = "Main"
        return tabBar
    }
    
    func makeChildCoordinator(settingsDelegate: SettingsCoordinatorDelegate) -> [Coordinator] {
        let settingsCoordinator = makeSettingsCoordinator(delegate: settingsDelegate)
        let communitiesCoordinator = makeCommunitiesCoordinator()
        let myPostsCoordinator = makeMyPostsCoordinator()
        return [myPostsCoordinator, communitiesCoordinator, settingsCoordinator]
    }
    
    private func makeSettingsCoordinator(delegate: SettingsCoordinatorDelegate) -> Coordinator {
        let factory = SettingsFactory(appDIContainer: appDIContainer)
        let navigation = UINavigationController()
        return SettingsCoordinator(navigation: navigation, factory: factory, delegate: delegate)
    }
    
    private func makeCommunitiesCoordinator() -> Coordinator {
        let factory = CommunitiesFactoryImp()
        let navigation = UINavigationController()
        return CommunitiesCoordinator(navigation: navigation, factory: factory)
    }
    
    private func makeMyPostsCoordinator() -> Coordinator {
        let factory = MyPostFactory()
        let mediator = MyPostMediatorImp()
        let navigation = UINavigationController()
        return MyPostCoordinator(navigation: navigation, factory: factory, medeiator: mediator)
    }
}
