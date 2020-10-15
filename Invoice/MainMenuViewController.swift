//
//  MainMenuViewController.swift
//  Invoice
//
//  Created by Fady Farag on 10/1/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit

class MainMenuViewController: UITableViewController {
    
    let cellHash = "1729"
    let menuItems = ["Accounts Receivable", "Inventory Management",
                     "Customer Management", "Employee Management",
                     "Parts Counter Menu", "Work Order Menu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Main Menu"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellHash)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        
        -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellHash, for: indexPath)
        
        let menuItem = self.menuItems[indexPath.row]
        cell.textLabel?.text = menuItem
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "goToAccounts", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationTableViewController = segue.destination
                    as! AccountsReceivableTableViewController
        
        destinationTableViewController.selectedMenuItem[0] = "Bills"
        destinationTableViewController.selectedMenuItem[1] = "Account Receivable"
    }
   

}
