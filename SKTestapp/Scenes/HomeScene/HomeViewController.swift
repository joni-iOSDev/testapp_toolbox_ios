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
    
    private func setPreferencesTitle() {
        title = viewModel?.titleViewController()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func showVideo() {
        
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
        let sigoutButtonItem = UIBarButtonItem(title: "Sign out", style: .done, target: self, action: #selector(logoutTapped))
        self.navigationItem.rightBarButtonItem = sigoutButtonItem
    }
    
    func closeScene() {
        self.coordinator?.goToLogIn()
    }
    
    func registerCell() {
        self.carouselsTableView.register(CarouselCell.nib(), forCellReuseIdentifier: CarouselCell.identifier)
        self.carouselsTableView.delegate = self
        self.carouselsTableView.dataSource = self
    }
    
    func refreshTableView() {
        self.carouselsTableView.reloadData()
    }
    
    func setupUI() {
        self.setPreferencesTitle()
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.rows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarouselCell.identifier, for: indexPath) as! CarouselCell
        self.presenter?.configure(cell, indexPath)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    // TODO: Implement
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HomeViewModel.heightTableViewCell()
    }
}
