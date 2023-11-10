//
//  MyPostMediator.swift
//  Coordinator
//
//  Created by Николай Игнатов on 10.11.2023.
//

import UIKit

protocol MyPostMediator {
    func updateController(title: String, navigation: UINavigationController)
}

struct MyPostMediatorImp: MyPostMediator {
    func updateController(title: String, navigation: UINavigationController) {
        guard let myPostViewController = navigation.topViewController as? MyPostsViewController else { return }
        myPostViewController.updateLabel(title: title)
    }
}
