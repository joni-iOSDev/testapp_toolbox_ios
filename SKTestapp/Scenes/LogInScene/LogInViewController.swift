//
//  LogInViewController.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var coordinator: MainCoordinator?
    var presenter: LogInPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        do {
            if let credential = try self.presenter?.credentialsValidation(with: usernameTextField.text,
                                                                          password: passwordTextField.text) {
                self.presenter?.requestLogin(credentials: credential)
            }
        } catch {
            self.showMessage(text: "Revise los datos ingresados")
        }
    }
    
    private func showMessage(text: String) {
        let alertController = UIAlertController(title: "User Message", message: text, preferredStyle: .alert)
        let alertDefaultAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alertController.addAction(alertDefaultAction)
        self.present(alertController, animated: true, completion: nil)
    }

}

extension LogInViewController: LogInDisplayLogic {
    
    func showFailureLogin(with message: String) {
        showMessage(text: message)
    }
    
    func showNextScene() {
        self.coordinator?.goToHome()
    }
}
