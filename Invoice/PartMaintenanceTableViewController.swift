//
//  PartMaintenanceTableViewController.swift
//  Invoice
//
//  Created by Fady Farag on 11/2/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit

class PartMaintenanceTableViewController: UITableViewController, UISearchBarDelegate {

   
    var rowSelected : Int?

    let cellHash = "1729"
    var selectedMenuItem = ["#1", "#2", "#3",
                            "#4", "#5", "#6"]
    
    var selectedMenuItemCopy = ["#1", "#2", "#3",
                            "#4", "#5", "#6"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        navigationItem.title = "Part Maintenance"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellHash)
    }
    
    @IBAction func addNewPart(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Part", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Entry", style: .default) { (action) in
            self.selectedMenuItem.append(textField.text!)
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "new part number"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            
           // print("delete")
            self.selectedMenuItem.remove(at: indexPath.row)
            self.selectedMenuItemCopy = self.selectedMenuItem
            self.tableView.reloadData()
            completionHandler(true)
        }
        
        deleteAction.image = UIImage(named: "delete-icon")
        deleteAction.backgroundColor = .red
        
        let swipeAction = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeAction;
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
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return selectedMenuItem.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goToPartsInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationTableViewController = segue.destination
                    as! PartsInfoViewController
        
        destinationTableViewController.partNumber = selectedMenuItem[rowSelected!]
        destinationTableViewController.rowSelected = rowSelected

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        
        -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellHash, for: indexPath)
        
        let menuItem = selectedMenuItem[indexPath.row]
        cell.textLabel?.text = menuItem
        
        return cell
    }

}
