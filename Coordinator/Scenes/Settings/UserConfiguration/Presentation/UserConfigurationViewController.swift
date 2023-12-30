//
//  UserConfigurationViewController.swift
//  Coordinator
//
//  Created by Николай Игнатов on 30.12.2023.
//

import UIKit

protocol UserConfigurationViewControllerCoordinator: AnyObject {
    func didSelectAvatarButton()
    func didFinishFlow()
}

final class UserConfigurationViewController: UIViewController {
    private weak var coordinator: UserConfigurationViewControllerCoordinator?
    
    private lazy var avatarButton = {
        let button = UIBarButtonItem(image: UIImage(systemName: "person"), primaryAction: avatarAction())
        return button
    }()
    
    private lazy var closeButton = {
        let button = UIBarButtonItem(systemItem: .close, primaryAction: closeFlowAction())
        return button
    }()
    
    init(coordinator: UserConfigurationViewControllerCoordinator?) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = avatarButton
        navigationItem.leftBarButtonItem = closeButton
    }
    
    private func avatarAction() -> UIAction {
        UIAction { [weak self] _ in
            self?.coordinator?.didSelectAvatarButton()
        }
    }
    private func closeFlowAction() -> UIAction {
        UIAction { [weak self] _ in
            self?.coordinator?.didFinishFlow()
        }
    }

}
