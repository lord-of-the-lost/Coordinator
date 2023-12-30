//
//  Coordinator.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigation: Navigation { get set }
    func start()
}
