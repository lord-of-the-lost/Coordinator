//
//  HomeFactory.swift
//  Coordinator
//
//  Created by Николай Игнатов on 30.12.2023.
//

import UIKit

protocol HomeFactory {
    func makeHomeViewController(coordinator: HomeViewControllerCoordinator) -> UIViewController
    func makeItemTabBar(navigation: Navigation)
    func makePostDetailsCoordinator(navigation: Navigation, id: Int, parentCoordinator: ParentCoordinator?) -> Coordinator
}

struct HomeFactoryImp: HomeFactory {
    func makeHomeViewController(coordinator: HomeViewControllerCoordinator) -> UIViewController {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
        let controller = HomeViewController(collectionViewLayout: layout, coordinator: coordinator)
        controller.navigationItem.title = "Home"
        return controller
    }
    
    
    func makeItemTabBar(navigation: Navigation) {
        makeItemTabBar(navigation: navigation,
                       title: "Home",
                       image: "house",
                       selectedImage: "house.fill")
    }
    
    func makePostDetailsCoordinator(navigation: Navigation, id: Int, parentCoordinator: ParentCoordinator?) -> Coordinator {
        let factory = PostDetailsFactory(id: id)
        let coordinator = PostDetailsCoordinator(navigation: navigation, factory: factory, parentCoordinator: parentCoordinator)
        return coordinator
    }
}

extension HomeFactoryImp: ItemTabBarFactory { }
