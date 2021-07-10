//
//  InitialViewController.swift
//  UI
//
//  Created by Renan Germano on 09/07/21.
//

import UIKit

import Analytics
import Service

public class InitialViewController: UIViewController {
    
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var loadingMessageLabel: UILabel!
    
    private let api = ConfigurationAPI()
    private var didGetConfigurations: Bool = false
    private var didGetColors: Bool = false
    
    public init() {
        super.init(nibName: "InitialViewController", bundle: Bundle(for: InitialViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        getRequiredConfigurations()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AnalyticsRelay.shared.didSeeScreen(withName: "Initial")
    }
    
    private func getRequiredConfigurations() {
        /**
         The original implementation requests the flags and colors using the API and controls the successfulness of this two requests by using the completion handlers and the two boolean properties of this class.
         After the end of both requests, if both boolean variables are true, the app shows the home screen, otherwise it keeps the user in this screen, resets the bool properties and display a "Try again" button.
         Here, I'm stubbing to simulate the successfulness of both requests after 1 second.
         */
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { timer in
            timer.invalidate()
            self.goAhead()
        })
    }
    
    private func goAhead() {
        DispatchQueue.main.async {
            self.navigationController?.isNavigationBarHidden = true
            self.navigationController?.setViewControllers([Navigator.shared.tabbar], animated: false)
        }
    }

}
