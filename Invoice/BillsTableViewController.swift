//
//  BillsTableViewController.swift
//  Invoice
//
//  Created by Fady Farag on 10/12/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit
import Alamofire

class BillsTableViewController: UITableViewController, UISearchBarDelegate {
    
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
        
        navigationItem.title = "Redstone"
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
        performSegue(withIdentifier: "goToDebty", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationTableViewController = segue.destination
                    as! DebtyViewController
        
        destinationTableViewController.debtyName = selectedMenuItem[rowSelected!]
        destinationTableViewController.rowSelected = rowSelected

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        
        -> UITableViewCell {
//
//            AF.request("http://192.168.4:3000/inventoryManagement/partsManagement/detailed",
//                       method: .post
//            ).validate().response { response in
//                    switch response.result {
//                        case .success( _):
//                            print("OK")
//                            break
//                        case .failure(_):
//                            print("Error")
//                            break
//                    }
//             }
            
        let cell = tableView.dequeueReusableCell(withIdentifier: cellHash, for: indexPath)
            
        let menuItem = selectedMenuItem[indexPath.row]
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
    
    
    @IBAction func addNewDebty(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new debty", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Entry", style: .default) { (action) in
            self.selectedMenuItem.append(textField.text!)
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "new debty"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
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


