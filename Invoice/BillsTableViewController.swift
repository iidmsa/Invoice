//
//  BillsTableViewController.swift
//  Invoice
//
//  Created by Fady Farag on 10/12/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit

class BillsTableViewController: UITableViewController {
    
    var rowSelected : Int?

    let cellHash = "1729"
    var selectedMenuItem = ["Aubrey Ridley", "Phillippa Weaver", "Joely Ashley",
                            "Gregor Griffiths", "Bertie Mccann", "Erik Carlson"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        navigationItem.title = "Bills"
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellHash, for: indexPath)
        
        let menuItem = selectedMenuItem[indexPath.row]
        cell.textLabel?.text = menuItem
        
        return cell
    }

}


