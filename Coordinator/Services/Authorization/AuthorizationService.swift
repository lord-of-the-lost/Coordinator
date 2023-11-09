//
//  AuthorizationService.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import Foundation

protocol SessionCheckerAuth {
    var isSessionActive: Bool { get }
}

final class AuthorizationService {
    private var session = false
    
    func logIn() {
        session = true
    }
    
    func logOut() {
        session = false
    }
}

extension AuthorizationService: SessionCheckerAuth {
    var isSessionActive: Bool {
        session
    }
}
