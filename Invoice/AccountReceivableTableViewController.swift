//
//  AccountReceivableTableViewController.swift
//  Invoice
//
//  Created by Fady Farag on 10/22/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit

class AccountReceivableTableViewController: UITableViewController,
                                            UISearchBarDelegate {
    
    var rowSelected : Int?

    let cellHash = "1729"
    var selectedMenuItem = ["Aubrey Ridley", "Phillippa Weaver", "Joely Ashley",
                            "Gregor Griffiths", "Bertie Mccann", "Erik Carlson"]
    
    var selectedMenuItemCopy = ["Aubrey Ridley", "Phillippa Weaver", "Joely Ashley",
                                "Gregor Griffiths", "Bertie Mccann", "Erik Carlson"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        navigationItem.title = "Account Receivable"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellHash)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return selectedMenuItem.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goToDebter", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationTableViewController = segue.destination
                    as! DebterViewController
        
        destinationTableViewController.debterName = selectedMenuItem[rowSelected!]
        destinationTableViewController.rowSelected = rowSelected

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        
        -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellHash, for: indexPath)
        
        let menuItem = selectedMenuItem[indexPath.row]
        cell.textLabel?.text = menuItem
        
        return cell
    }
    
    
    @IBAction func addNewDebter(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new debter", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Entry", style: .default) { (action) in
            self.selectedMenuItem.append(textField.text!)
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "new debter"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        //print(searchBar.text!)
        
        if selectedMenuItem.contains(where: {$0 == searchBar.text!}) {
            selectedMenuItem = [searchBar.text!]
        }
        self.tableView.reloadData()
 
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            selectedMenuItem = selectedMenuItemCopy
            self.tableView.reloadData()
        }
    }
    
}


