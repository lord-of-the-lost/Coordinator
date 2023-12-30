//
//  PostDetailsViewController.swift
//  Coordinator
//
//  Created by Николай Игнатов on 30.12.2023.
//

import UIKit

protocol PostDetailsViewControllerCoordinator: AnyObject {
    func didTapPhotosButton()
    func didTapMoreDetailsButton()
    func didTapSourceButton()
}

final class PostDetailsViewController: UIViewController {
    
    private weak var coordinator: PostDetailsViewControllerCoordinator?
    
    private lazy var photosButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Photos"
        button.configuration = configuration
        return button
    }()
    
    private lazy var moreDetailsButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "More Details"
        button.configuration = configuration
        return button
    }()
    
    private lazy var sourceButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Source"
        button.configuration = configuration
        return button
    }()
    
    private lazy var stackView = {
        let stackView = UIStackView(arrangedSubviews: [photosButton,
                                                       moreDetailsButton,
                                                       sourceButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
   
    init(coordinator: PostDetailsViewControllerCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        configActions()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func configActions() {
        let photoAction = UIAction { [weak self] _ in
            self?.coordinator?.didTapPhotosButton()
        }
        photosButton.addAction(photoAction, for: .touchUpInside)
        
        let moreDetailsAction = UIAction { [weak self] _ in
            self?.coordinator?.didTapMoreDetailsButton()
        }
        moreDetailsButton.addAction(moreDetailsAction, for: .touchUpInside)
        
        let sourceAction = UIAction { [weak self] _ in
            self?.coordinator?.didTapSourceButton()
        }
        sourceButton.addAction(sourceAction, for: .touchUpInside)
    }
}

