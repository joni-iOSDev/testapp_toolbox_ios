//
//  HomeConfiguratorImplementation.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import Foundation

protocol HomeConfigurator: AnyObject {
    func configure(_ viewController: HomeViewController, coordinator: MainCoordinator)
}

class HomeConfiguratorImplementation: HomeConfigurator {
    
    func configure(_ viewController: HomeViewController, coordinator: MainCoordinator) {
        let presenterImplementation =  HomePresenterImplementation(viewControllerDisplayLogic: viewController)
        let viewModel = HomeViewModel(presenter: presenterImplementation)
        let datasource = CarouselsDataSourceImplementation()
        let repository = CarouselsRepositoryImplementation.init(source: datasource)
        
        presenterImplementation.getCarouselsUseCase = GetCarouselsUseCase(repository: repository)
        
        viewController.viewModel = viewModel
        viewController.coordinator = coordinator
        viewController.presenter = presenterImplementation
    }
}
