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

protocol LogInAuth {
    func logIn()
}

protocol LogOutAuth {
    func logOut()
}

final class AuthorizationService {
    private var session = false
}

extension AuthorizationService: SessionCheckerAuth {
    var isSessionActive: Bool {
        session
    }
}

extension AuthorizationService: LogInAuth {
    func logIn() {
        session = true
    }
}

extension AuthorizationService: LogOutAuth {
    func logOut() {
        session = false
    }
}
