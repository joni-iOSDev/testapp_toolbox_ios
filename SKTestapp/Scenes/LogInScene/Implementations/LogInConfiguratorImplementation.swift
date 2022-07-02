//
//  LogInConfiguratorImplementation.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation

protocol LogInConfigurator: AnyObject {
    func configure(_ viewController: LogInViewController, coordinator: MainCoordinator)
}

class LogInConfiguratorImplementation: LogInConfigurator {
    
    func configure(_ viewController: LogInViewController, coordinator: MainCoordinator) {
        let presenterImplementation =  LogInPresenterImplementation()
        let loginUseCase = SendLoginRequestUseCase()
        let authenticationDatasource = AuthenticationDataSourceImplementation()
        let authenticationRepository = AuthenticationRepositoryImplementation()
        
        authenticationRepository.datasource = authenticationDatasource
        loginUseCase.repository = authenticationRepository
        viewController.coordinator = coordinator
        viewController.presenter = presenterImplementation
        presenterImplementation.logInUseCase = loginUseCase
    }
}
