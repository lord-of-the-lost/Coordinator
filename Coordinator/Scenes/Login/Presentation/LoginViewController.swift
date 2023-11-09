//
//  LoginViewController.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import UIKit

protocol LoginViewControllerCoordinator: AnyObject {
    func didFinish()
}

final class LoginViewController: UIViewController {
    
    private weak var coordinator: LoginViewControllerCoordinator?
    private let viewModel: LoginViewModel
    
    private lazy var logInButton: UIButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "LogIn"
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(coordinator: LoginViewControllerCoordinator?, viewModel: LoginViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureAction()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(logInButton)
        logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func configureAction() {
        let loginAction = UIAction { [weak self] _ in
            guard let self else { return }
            self.viewModel.logIn()
            self.coordinator?.didFinish()
        }
        logInButton.addAction(loginAction, for: .touchUpInside)
    }
}

