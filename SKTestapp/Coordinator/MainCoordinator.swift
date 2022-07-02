//
//  MainCoordinator.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation
import UIKit

class MainCoordinator: CoordinatorProtocol {
    
    fileprivate var window: UIWindow
    
    var navigationController: UINavigationController
    
    init(scene: UIWindowScene) {
        self.navigationController = UINavigationController()
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window.windowScene = scene
        setupCoordinator()
    }
    
    // MARK: - Init Flow
    func start() {
        SessionManager.shared.isLogged() ? goToHome() : goToLogIn()
    }
    
    //MARK: - Setup COORDINATOR
    func setupCoordinator() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}

extension MainCoordinator {
    // MARK: - GO TO
    // MARK: - Login
    func goToLogIn() {
        let login = LogInViewController()
        let configurator = LogInConfiguratorImplementation()
        configurator.configure(login, coordinator: self)
        navigationController = UINavigationController(rootViewController: login)
        self.setupCoordinator()
    }
    
    func goToHome() {
        let homeVC = HomeViewController()
        let homeConfigurator = HomeConfiguratorImplementation()
        homeConfigurator.configure(homeVC, coordinator: self)
        
        let navController = UINavigationController(rootViewController: homeVC)
        navigationController = navController
        self.setupCoordinator()

    }
}
