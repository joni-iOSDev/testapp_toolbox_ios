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
    
    init(scene: UIWindowScene  ) {
        self.navigationController = UINavigationController()
        window = UIWindow(frame: scene.coordinateSpace.bounds)
        window.windowScene = scene
        setupCoordinator()
    }
    
    // MARK: - Init Flow
    func start() {
        goToLogIn()
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
        navigationController.pushViewController(login, animated: true)
    }
}
