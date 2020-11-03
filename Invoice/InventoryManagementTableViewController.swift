//
//  InventoryManagementTableViewController.swift
//  Invoice
//
//  Created by Fady Farag on 31/10/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit

class InventoryManagementTableViewController: UITableViewController, UISearchBarDelegate {
    
    var rowSelected: Int?
    let cellHash = "1729"
    var selectedMenuItem = ["", ""]
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        navigationItem.title = "Inventory Management"
        navigationController?.navigationBar.prefersLargeTitles = false
        
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
            performSegue(withIdentifier: "goToParts", sender: self)
        }
//        else if rowSelected == 1 {
//            performSegue(withIdentifier: "goToAccount", sender: self)
//        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        
        -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellHash, for: indexPath)
        
        let menuItem = selectedMenuItem[indexPath.row]
        cell.textLabel?.text = menuItem
        
        return cell
    }
}
