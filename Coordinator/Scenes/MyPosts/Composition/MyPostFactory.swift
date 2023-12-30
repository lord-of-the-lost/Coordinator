//
//  MyPostFactory.swift
//  Coordinator
//
//  Created by Николай Игнатов on 10.11.2023.
//

import UIKit

struct MyPostFactory: ItemTabBarFactory {
    func makeMyPostViewController(coordinator: MyPostsViewControllerCoordinator) -> UIViewController {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
        let controller = MyPostsViewController(collectionViewLayout: layout, coordinator: coordinator)
        controller.navigationItem.title = "My Posts"
        return controller
    }
    
    func makeNewPostViewController(coordinator: NewPostViewControllerCoordinator) -> UIViewController {
        NewPostViewController(coordinator: coordinator)
    }
    
    func makeItemTabBar(navigation: Navigation) {
        makeItemTabBar(navigation: navigation,
                       title: "MyPosts",
                       image: "list.bullet.rectangle.portrait",
                       selectedImage: "list.bullet.rectangle.portrait.fill")
    }
    
    func makePostDetailsCoordinator(navigation: Navigation, id: Int, parentCoordinator: ParentCoordinator?) -> Coordinator {
        let factory = PostDetailsFactory(id: id)
        let coordinator = PostDetailsCoordinator(navigation: navigation, factory: factory, parentCoordinator: parentCoordinator)
        return coordinator
    }
}
