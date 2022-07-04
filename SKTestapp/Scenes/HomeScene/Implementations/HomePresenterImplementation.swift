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
        viewController.registerCell()
        viewController.setupUI()
    }
    
    private func getCarousels() {
        self.getCarouselsUseCase?.executeUseCase(completionHandler: { carouselsResult in
            switch carouselsResult {
                case .success(let carousels):
                    self.carousels = carousels
                    self.viewController.refreshTableView()
                    break
                case .failure(_):
                    self.viewController.showFailureLogin(with: "Hubo un error con su sessión, lo sentimos")
                    break
            }
        })
    }
    
    func configure(_ cell: CarouselCellDisplayLogic, _ index: IndexPath) {
        let carousel = self.carousels[index.row]
        let viewModel = CarouselViewModel(courselModel: carousel)
        cell.setCarousel(viewModel)
    }
    
    func logout() {
        SessionManager.shared.signOut { [weak self] in
            self?.viewController.closeScene()
        }
    }
}
