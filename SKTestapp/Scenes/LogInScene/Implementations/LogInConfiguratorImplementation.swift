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
        let presenterImplementation =  LogInPresenterImplementation(viewControllerDisplayLogic: viewController)
        let authenticationDatasource = AuthenticationDataSourceImplementation()
        let authenticationRepository = AuthenticationRepositoryImplementation(source: authenticationDatasource)
        let loginUseCase = SendLoginRequestUseCase(repository: authenticationRepository)

        viewController.coordinator = coordinator
        viewController.presenter = presenterImplementation
        presenterImplementation.logInUseCase = loginUseCase
    }
}
