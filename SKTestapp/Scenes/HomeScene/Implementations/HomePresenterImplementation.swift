//
//  HomePresenterImplementation.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import Foundation

class HomePresenterImplementation {
    
    private var viewController: HomeDisplayLogic
    var getCarouselsUseCase: GetCarouselsUseCase?
    private var carousels: [Carousel] = []
    
    init(viewControllerDisplayLogic: HomeDisplayLogic) {
        self.viewController = viewControllerDisplayLogic
    }
}


extension HomePresenterImplementation: HomePresenter {
    
    func getCountList() -> Int {
        return carousels.count
    }
    
    
    func actionAlertTapped() {
        // default action
        self.logout()
    }
    
    func viewDidLoad() {
        viewController.configureSigOutButton()
        getCarousels()
    }
    
    private func getCarousels() {
        self.getCarouselsUseCase?.executeUseCase(completionHandler: { carouselsResult in
            switch carouselsResult {
                case .success(let carousels):
                    self.carousels = carousels
                    break
                case .failure(let error):
                    self.viewController.showFailureLogin(with: "Hubo un error con su sessión, lo sentimos")
                    break
            }
        })
    }
    
    func logout() {
        SessionManager.shared.signOut { [weak self] in
            self?.viewController.closeScene()
        }
    }
}
