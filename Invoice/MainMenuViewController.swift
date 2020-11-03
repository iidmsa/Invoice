//
//  MainMenuViewController.swift
//  Invoice
//
//  Created by Fady Farag on 10/1/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit

class MainMenuViewController: UITableViewController, UISearchBarDelegate  {
    
    var rowSelected: Int?
    
    let cellHash = "1729"
    var menuItems = ["Accounts Receivable", "Inventory Management",
                     "Customer Management", "Employee Management",
                     "Parts Counter Menu", "Work Order Menu"]
    
    var menuItemsCopy = ["Accounts Receivable", "Inventory Management",
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
//        cell.delegate = self
        let menuItem = self.menuItems[indexPath.row]
        cell.textLabel?.text = menuItem
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        if rowSelected == 0 {
            performSegue(withIdentifier: "goToAccounts", sender: self)
        } else if rowSelected == 1 {
            performSegue(withIdentifier: "goToInv", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if rowSelected == 0 {
            let destinationTableViewController = segue.destination
                        as! AccountsReceivableTableViewController
            
            destinationTableViewController.selectedMenuItem[0] = "Bills"
            destinationTableViewController.selectedMenuItem[1] = "Account Receivable"
        } else if rowSelected == 1 {
            let destinationTableViewController = segue.destination
                        as! InventoryManagementTableViewController
            
            destinationTableViewController.selectedMenuItem[0] = "Part Maintenance"
            destinationTableViewController.selectedMenuItem[1] = "Class Management"
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
            if menuItems.contains(where: {$0 == searchBar.text!}) {
               menuItems = [searchBar.text!]
            }
        
            self.tableView.reloadData()
            
    }
        
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchBar.text!)
        if searchBar.text?.count == 0 {
            menuItems = menuItemsCopy
            self.tableView.reloadData()
        }
    }
   

}
