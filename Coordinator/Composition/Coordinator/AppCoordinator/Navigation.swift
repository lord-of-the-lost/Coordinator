//
//  Navigation.swift
//  Coordinator
//
//  Created by Николай Игнатов on 30.12.2023.
//

import UIKit

protocol Navigation {
    var rootViewController: UINavigationController { get }
    var viewControllers: [UIViewController] { get set }
    var navigationBar: UINavigationBar { get }
    var dissmissNavigation: (() -> Void)? { get set }
    func present(_ viewControllerToPresent: UIViewController, animated: Bool)
    func pushViewController(_ viewControllerToPresent: UIViewController,
                            animated: Bool,
                            backComplition:(() -> Void)?)
    func dismiss(animated: Bool)
}

extension Navigation {
    func pushViewController(_ viewControllerToPresent: UIViewController,
                            animated: Bool) {
        pushViewController(viewControllerToPresent, animated: animated, backComplition: nil)
    }
}

final class NavigationImp: NSObject {
    var rootViewController: UINavigationController
    var dissmissNavigation: (() -> Void)?
    
    private var backCompletions: [UIViewController: () -> Void] = [:]
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
        super.init()
        rootViewController.delegate = self
        rootViewController.presentationController?.delegate = self
    }
}

extension NavigationImp: Navigation {
    var viewControllers: [UIViewController] {
        get {
            rootViewController.viewControllers
        }
        set {
            rootViewController.viewControllers = newValue
        }
    }
    
    var navigationBar: UINavigationBar {
        rootViewController.navigationBar
    }
    
    func present(_ viewControllerToPresent: UIViewController, animated: Bool) {
        rootViewController.present(viewControllerToPresent, animated: animated)
    }
    
    func dismiss(animated: Bool) {
        rootViewController.dismiss(animated: animated)
    }
    
    func pushViewController(_ viewControllerToPresent: UIViewController, animated: Bool, backComplition: (() -> Void)?) {
        if let backComplition {
            backCompletions[viewControllerToPresent] = backComplition
        }
        rootViewController.pushViewController(viewControllerToPresent, animated: true)
    }
}

extension NavigationImp: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let controller = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(controller) else { return }
        guard let complition = backCompletions[controller] else { return }
        complition()
        backCompletions.removeValue(forKey: controller)
    }
}

extension NavigationImp: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        dissmissNavigation?()
        dissmissNavigation = nil
    }
}
