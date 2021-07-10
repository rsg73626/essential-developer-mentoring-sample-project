//
//  CartView.swift
//  Checkout
//
//  Created by Renan Germano on 09/07/21.
//

import UIKit

import Analytics

public class CartView: UIViewController {
    
    public init() {
        super.init(nibName: "CartView", bundle: Bundle(for: CartView.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        title = "Cart"
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AnalyticsRelay.shared.didSeeScreen(withName: "Cart")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
