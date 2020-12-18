//
//  AccountsReceivableTableViewController.swift
//  Invoice
//
//  Created by Fady Farag on 10/12/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AccountsReceivableTableViewController: UITableViewController, UISearchBarDelegate {
    
    var rowSelected: Int?
    let cellHash = "1729"
    var selectedMenuItem = ["", "", ""]
    var selectedMenuItemCopy = ["", "", ""]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        navigationItem.title = "Accounts Receivable"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellHash)
//        selectedMenuItemCopy = selectedMenuItem
        httpsNetworkCallAccountsRecievable()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        if rowSelected == 0 {
            performSegue(withIdentifier: "goToBills", sender: self)
        } else if rowSelected == 1 {
            performSegue(withIdentifier: "goToAccount", sender: self)
        }
        
    }
    
    func httpsNetworkCallAccountsRecievable() {
        AF.request("http://192.168.0.4:3000/accountsRecievable",
                   method: .get
        ).validate().responseJSON { response in
                switch response.result {
                    case .success( _):
                        print("OK")
                        print(response)
                        let accountsRecievableJSON: JSON = JSON(response.value!)
                        
                        self.selectedMenuItem[0].append(accountsRecievableJSON[0]["CompanyName"].string!)
                        self.selectedMenuItem[1].append(accountsRecievableJSON[1]["CompanyName"].string!)
                        self.selectedMenuItem[2].append(accountsRecievableJSON[2]["CompanyName"].string!)
                        self.tableView.reloadData()
//                        print("DEBUG: net")
                        print(self.selectedMenuItem)
                        break
                    case .failure(_):
                        print("Error: accountsRecievable ")
                        break
                }
         }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellHash, for: indexPath)
//            print("DEBUG: fill")
            let menuItem = selectedMenuItem[indexPath.row]
            cell.textLabel?.text = menuItem
        
            return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
//        print(searchBar.text!)
        
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
