//
//  HomeFactory.swift
//  Coordinator
//
//  Created by Николай Игнатов on 30.12.2023.
//

import UIKit

protocol HomeFactory {
    func  makeHomeViewController(coordinator: HomeViewControllerCoordinator) -> UIViewController
    func makeItemTabBar(navigation: UINavigationController)
}

struct HomeFactoryImp: HomeFactory {
    func makeHomeViewController(coordinator: HomeViewControllerCoordinator) -> UIViewController {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
        let controller = HomeViewController(collectionViewLayout: layout, coordinator: coordinator)
        controller.navigationItem.title = "Home"
        return controller
    }
    
    
    func makeItemTabBar(navigation: UINavigationController) {
        makeItemTabBar(navigation: navigation,
                       title: "Home",
                       image: "house",
                       selectedImage: "house.fill")
    }
}

extension HomeFactoryImp: ItemTabBarFactory { }
