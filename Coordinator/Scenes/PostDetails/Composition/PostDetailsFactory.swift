//
//  PostDetailsFactory.swift
//  Coordinator
//
//  Created by Николай Игнатов on 30.12.2023.
//

import UIKit

struct PostDetailsFactory {
    private(set) var id: Int
    
    func makePostDetailsViewController(coordinator: PostDetailsViewControllerCoordinator) -> UIViewController {
        let controller = PostDetailsViewController(coordinator: coordinator)
        controller.title = "Post #\(id)"
        return controller
    }
    
    func makePhotosViewController() -> UIViewController {
        makeExampleViewController(title: "Photos")
    }
    
    func makeMoreDetailsViewController() -> UIViewController {
        makeExampleViewController(title: "More Details")
    }

    func makeSourceViewController() -> UIViewController {
        makeExampleViewController(title: "Source")
    }

    
    private func makeExampleViewController(title: String) -> UIViewController {
        let controller = ExampleViewController()
        controller.title = title
        let navigation = NavigationImp(rootViewController: UINavigationController(rootViewController: controller))
        return navigation.rootViewController
    }

}
