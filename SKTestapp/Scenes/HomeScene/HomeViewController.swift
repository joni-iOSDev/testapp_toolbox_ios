//
//  HomeViewController.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 02/07/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var carouselsTableView: UITableView!
    
    var coordinator: MainCoordinator?
    var presenter: HomePresenter?
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        presenter?.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func showMessage(text: String) {
        let alertController = UIAlertController(title: "User Message", message: text, preferredStyle: .alert)
        
        let alertDefaultAction = UIAlertAction(title: "Aceptar", style: .default) { [weak self] actionTapped in
            self?.presenter?.actionAlertTapped()
        }
        alertController.addAction(alertDefaultAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

}

extension HomeViewController: HomeDisplayLogic {
    
    func showFailureLogin(with message: String) {
        showMessage(text: message)
    }
    
    
    @objc private func logoutTapped() {
        self.presenter?.logout()
    }
    
    func configureSigOutButton() {
        let sigoutButtonItem = UIBarButtonItem(title: "Sig out", style: .done, target: self, action: #selector(logoutTapped))
        self.navigationItem.rightBarButtonItem = sigoutButtonItem
    }
    
    func closeScene() {
        coordinator?.goToLogIn()
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    
}
