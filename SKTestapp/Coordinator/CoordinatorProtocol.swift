//
//  CoordinatorProtocol.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    
    var navigationController: UINavigationController { get set }
    func start()
    
}
