//
//  AccountsReceivableTableViewController.swift
//  Invoice
//
//  Created by Fady Farag on 10/12/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit

class AccountsReceivableTableViewController: UITableViewController {
    
    var rowSelected: Int?
    let cellHash = "1729"
    var selectedMenuItem = ["", ""]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        navigationItem.title = "Accounts Receivable"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellHash)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        if rowSelected == 0 {
            performSegue(withIdentifier: "goToBills", sender: self)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        
        -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellHash, for: indexPath)
        
        let menuItem = selectedMenuItem[indexPath.row]
        cell.textLabel?.text = menuItem
        
        return cell
    }
}
