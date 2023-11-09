//
//  LoginViewModel.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import Foundation

final class LoginViewModel {
    var authorization: LogInAuth?
    init(authorization: LogInAuth?) {
        self.authorization = authorization
    }
    
    func logIn() {
        authorization?.logIn()
    }
}
