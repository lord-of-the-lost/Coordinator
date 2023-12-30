//
//  ItemTabBarFactory.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import UIKit

protocol ItemTabBarFactory {}

extension ItemTabBarFactory {
    func makeItemTabBar(navigation: Navigation, title: String, image: String, selectedImage: String) {
        let tabBarItem = UITabBarItem(title: title,
                                      image: UIImage(systemName: image),
                                      selectedImage: UIImage(systemName: selectedImage))
        navigation.rootViewController.tabBarItem = tabBarItem
    }
}
