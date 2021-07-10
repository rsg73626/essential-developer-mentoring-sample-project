//
//  LoginView.swift
//  UI
//
//  Created by Renan Germano on 09/07/21.
//

import UIKit

import Analytics

class LoginView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AnalyticsRelay.shared.didSeeScreen(withName: "Login")
    }

}
