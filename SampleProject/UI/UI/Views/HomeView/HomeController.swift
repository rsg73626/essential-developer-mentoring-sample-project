//
//  HomeController.swift
//  UI
//
//  Created by Renan Germano on 09/07/21.
//

import UIKit

import Analytics
import Models
import Service

protocol HomeControllerDelegate: AnyObject {
    func homeControllerDelegateDidGetHome()
    func homeControllerDelegateDidFailToGetHome()
    func homeControllerDelegatePush(viewController: UIViewController)
    func homeControllerDelegateDidProductToCart()
    func homeControllerDelegateDidFailToAddProductToCart()
}

class HomeController {

    private let configurationAPI = ConfigurationAPI()
    weak var delegate: HomeControllerDelegate?
    
    func getHome() {
        configurationAPI.getHome(onSuccess: {
                                    self.delegate?.homeControllerDelegateDidGetHome()
                                 },
                                 onError: {
                                    self.delegate?.homeControllerDelegateDidFailToGetHome()
                                 })
    }
    
    func showProductDetails(_ product: SearchProduct) {
        let productDetailsView = UIViewController() // ProductDetailsView(product: product)
        delegate?.homeControllerDelegatePush(viewController: productDetailsView)
    }
    
    func addProductToCart(_ product: SearchProduct) {
        // call the api to add the product to cart
        AnalyticsRelay.shared.didAddProductToCart(productName: "ABC", productPrice: 20.0)
        delegate?.homeControllerDelegateDidFailToAddProductToCart()
    }
    
}
