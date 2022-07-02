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
}

protocol HomeViewModelPresenter {
    func getCountList() -> Int
}
