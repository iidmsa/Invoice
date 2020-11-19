//
//  CustomerManagementTableViewController.swift
//  Invoice
//
//  Created by Fady Farag on 11/16/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit

class CustomerManagementTableViewController: UITableViewController, UISearchBarDelegate {
    
    var rowSelected: Int?
    let cellHash = "1729"
    
    var selectedMenuItem = ["", "", "",
                            "", "", ""]
    
    var selectedMenuItemCopy = ["Aubrey Ridley", "Phillippa Weaver", "Joely Ashley",
                                "Gregor Griffiths", "Bertie Mccann", "Erik Carlson"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Customer Management"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellHash)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return selectedMenuItem.count
    }
    
    @IBAction func refreshButtonAction(_ sender: Any) {
        selectedMenuItem = selectedMenuItemCopy
        self.tableView.reloadData()
       
    }
    
//    lazy var forRowAtSelector = { func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
//
//        -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: self.cellHash, for: indexPath)
//
//            let menuItem = self.selectedMenuItem[indexPath.row]
//        cell.textLabel?.text = menuItem
//
//        return cell
//        }
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: self.cellHash, for: indexPath)
            
            let menuItem = self.selectedMenuItem[indexPath.row]
        cell.textLabel?.text = menuItem

        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
           let checkAction = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
               
               self.selectedMenuItem.remove(at: indexPath.row)
               self.selectedMenuItemCopy = self.selectedMenuItem
               
               let alert = UIAlertController(title: "Are you sure ?", message: "This will permanently delete this entry.", preferredStyle: .alert)

               let action = UIAlertAction(title: "Delete", style: .default) { (action) in
                   self.tableView.reloadData()
               }
               alert.addAction(action)
               self.present(alert, animated: true, completion: nil)
               
               completionHandler(true)
           }
           
           var swipeAction: UISwipeActionsConfiguration?
           
           checkAction.image = UIImage(named: "delete-icon")
           checkAction.backgroundColor = .red
           
           swipeAction = UISwipeActionsConfiguration(actions: [checkAction])
           
           return swipeAction;
       }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
           
           // print(searchBar.text!)
           
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
