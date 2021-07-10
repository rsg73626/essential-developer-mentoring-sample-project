//
//  Navigator.swift
//  UI
//
//  Created by Renan Germano on 09/07/21.
//

import UIKit

import Checkout

// A helper class to perform some screen transitions
public class Navigator {
    
    public static let shared = Navigator()
    
    private init() { }
    
    lazy var tabbar: UITabBarController = {
        let tabbar = UITabBarController()
        let viewControllers = [HomeView(), CategoriesView(), LoginView(), CartView()]
        let navs: [UINavigationController] = viewControllers.map {
            _ = $0.view
            return UINavigationController(rootViewController: $0)
        }
        tabbar.viewControllers = navs
        return tabbar
    }()
    
    func selectTabbarSection(_ index: Int) {
        tabbar.selectedIndex = index
    }
    
    func selectTabbarSection(_ viewControllerType: UIViewController.Type) {
        // ...
    }
    
}
