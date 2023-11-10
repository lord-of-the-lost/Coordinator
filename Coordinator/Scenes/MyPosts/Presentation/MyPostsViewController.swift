//
//  MyPostsViewController.swift
//  Coordinator
//
//  Created by Николай Игнатов on 10.11.2023.
//

import UIKit

protocol MyPostsViewControllerCoordinator: AnyObject {
    func didSelectPost(id: Int)
    func didTapAddNewPostButton()
}

final class MyPostsViewController: UICollectionViewController {
    
    private weak var coordinator: MyPostsViewControllerCoordinator?
    
    private let exampleLabel = UILabel()
    
    private var counter = 0
    
    init(collectionViewLayout: UICollectionViewLayout, coordinator: MyPostsViewControllerCoordinator) {
        self.coordinator = coordinator
        super.init(collectionViewLayout: collectionViewLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configCollectionView()
    }
    
    func updateLabel(title: String) {
        exampleLabel.text = title
        counter += 1
        collectionView.reloadData()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        let newPostBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: addNewPostAсtion())
        navigationItem.rightBarButtonItem = newPostBarButtonItem
        
        exampleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exampleLabel)
        exampleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        exampleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func addNewPostAсtion() -> UIAction {
        UIAction { [weak self] _ in
            self?.coordinator?.didTapAddNewPostButton()
        }
    }
    
    private func configCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "id")
        collectionView.backgroundColor = .systemBackground
    }
}

extension MyPostsViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        counter
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath)
        var contentConfiguration = UIListContentConfiguration.cell()
        contentConfiguration.text = "Hello"
        contentConfiguration.secondaryText = "there"
        contentConfiguration.image = UIImage(systemName: "photo")
        cell.contentConfiguration = contentConfiguration
        cell.backgroundColor = .systemBackground
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.didSelectPost(id: indexPath.row)
    }
}
