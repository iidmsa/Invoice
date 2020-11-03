//
//  PartsInfoViewController.swift
//  Invoice
//
//  Created by Fady Farag on 11/2/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit

class PartsInfoViewController: UIViewController {
    
    var partNumber: String = "Untitled"
    var rowSelected: Int?
    fileprivate var selectedRow: Int?

    @IBOutlet weak var descrptionLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var onOrderLabel: UILabel!
    
    @IBOutlet weak var sourceLabel: UILabel!
    
    @IBOutlet weak var brandLabel: UILabel!
    
    @IBOutlet weak var totalSoldLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Part " + partNumber
        navigationController?.navigationBar.prefersLargeTitles = true
        
        descrptionLabel.text = "Part"
        quantityLabel.text = "2"
        onOrderLabel.text = "1"
        sourceLabel.text = "CC"
        brandLabel.text = "Cobra"
        totalSoldLabel.text = "100"
        
    }
    


}
