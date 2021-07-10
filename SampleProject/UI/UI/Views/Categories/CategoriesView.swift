//
//  CategoriesView.swift
//  UI
//
//  Created by Renan Germano on 09/07/21.
//

import UIKit

import Analytics

class CategoriesView: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Categories"
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AnalyticsRelay.shared.didSeeScreen(withName: "Categories")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
}
