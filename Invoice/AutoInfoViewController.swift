//
//  AutoInfoViewController.swift
//  Invoice
//
//  Created by Fady Farag on 11/3/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit

class AutoInfoViewController: UIViewController {
    
    var autoCategory: String = "Untitled"
    var rowSelected: Int?
    fileprivate var selectedRow: Int?

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var margin1Label: UILabel!
    @IBOutlet weak var margin2Label: UILabel!
    @IBOutlet weak var margin3Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = autoCategory
        navigationController?.navigationBar.prefersLargeTitles = true
        
        descriptionLabel.text = "Class"
        margin1Label.text = "90%"
        margin2Label.text = "80%"
        margin3Label.text = "70%"
    }
    
}
