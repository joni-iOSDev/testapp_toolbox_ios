//
//  HomePresenter.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import Foundation

protocol HomePresenter: AnyObject, HomeViewModelPresenter {
    func viewDidLoad()
    func logout()
    func actionAlertTapped()
    func configure(_ cell: CarouselCellDisplayLogic, _ index: IndexPath)
}

protocol HomeViewModelPresenter {
    func getCountList() -> Int
}
