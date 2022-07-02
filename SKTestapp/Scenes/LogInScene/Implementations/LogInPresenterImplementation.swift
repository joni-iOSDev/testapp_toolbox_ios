//
//  LogInPresenterImplementation.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation

typealias passwordEncoded = Data

class LogInPresenterImplementation {
    weak var viewController: LogInDisplayLogic?
    var logInUseCase: SendLoginRequestUseCase?
    
}

extension LogInPresenterImplementation: LogInPresenter {
    
    func viewDidLoad() {
        // TODO
    }
    
    func credentialsValidation(with username: String?, password: String?) throws -> UserCredentials {
        // TODO: Implement a class to validate regex and constraints
        // Basic credential validation
        guard let user = username else { throw AppUserCredentialErrors.invalidCredentials}
        guard let pwd = password else { throw AppUserCredentialErrors.invalidCredentials}
        
        if user.isEmpty || pwd.isEmpty {
            throw AppUserCredentialErrors.invalidCredentials
        }
        
        let userCredential = UserCredentials(username: user, password: pwd)
        return userCredential
    }
    
    func requestLogin(credentials: UserCredentials) {
        
        logInUseCase?.executeRequest(credentials, { [weak self] resultUseCase in
            switch resultUseCase {
                case .success(_):
                    ()
                case .failure(_):
                    self?.viewController?.showFailureLogin(with: "usuario o contraseña incorrectos")
            }
        })
    }
}

