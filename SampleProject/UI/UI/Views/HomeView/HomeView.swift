//
//  HomeView.swift
//  UI
//
//  Created by Renan Germano on 09/07/21.
//

import UIKit

import Analytics
import Models

class HomeView: UITableViewController {
    
    private let controller = HomeController()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.startAnimating()
        ai.hidesWhenStopped = true
        ai.isHidden = true
        tableView.addSubview(ai)
        ai.translatesAutoresizingMaskIntoConstraints = false
        ai.centerXAnchor.constraint(equalTo: tableView.centerXAnchor).isActive = true
        ai.centerYAnchor.constraint(equalTo: tableView.centerYAnchor).isActive = true
        return ai
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        
        tableView.rowHeight = 350
        tableView.separatorStyle = .none
        tableView.register(ProductsCollectionCell.defaultNib, forCellReuseIdentifier: "ProductsCollectionCell")
        
        controller.delegate = self
        showLoading()
        controller.getHome()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AnalyticsRelay.shared.didSeeScreen(withName: "Home")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int { 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { Home.shared?.elements.count ?? .zero }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let home = Home.shared else {
            return UITableViewCell()
        }
        
        func getProductsCollectionCell() -> UITableViewCell {
            guard let search = home.elements[indexPath.item].element as? Search,
                  let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsCollectionCell", for: indexPath) as? ProductsCollectionCell else {
                return UITableViewCell()
            }
            
            cell.configure(withProductsSearch: search)
            
            return cell
        }
        
        let getCellFunctions: [HomeElementType:()->UITableViewCell] = [
            .productsList: getProductsCollectionCell
        ]
        
        return getCellFunctions[home.elements[indexPath.item].type]?() ?? UITableViewCell()
    }
    
    private func showLoading() {
        activityIndicator.startAnimating()
    }
    
    private func hideLoading() {
        activityIndicator.stopAnimating()
    }
    
}

extension HomeView: ProductsCollectionCellDelegate {
    
    func productsCollectionCellDelegate(didSelectProduct product: SearchProduct) {
        controller.showProductDetails(product)
    }
    
    func productsCollectionCellDelegate(didPressAddProductToCart product: SearchProduct) {
        showLoading()
        controller.addProductToCart(product)
    }
    
}

extension HomeView: HomeControllerDelegate {
    
    func homeControllerDelegateDidGetHome() {
        DispatchQueue.main.async {
            self.hideLoading()
            self.tableView.reloadData()
        }
    }
    
    func homeControllerDelegateDidFailToGetHome() {
        DispatchQueue.main.async {
            self.hideLoading()
        }
    }
    
    func homeControllerDelegatePush(viewController: UIViewController) {
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func homeControllerDelegateDidProductToCart() {
        // show success message
    }
    
    func homeControllerDelegateDidFailToAddProductToCart() {
        // show error message
    }
    
    
}
