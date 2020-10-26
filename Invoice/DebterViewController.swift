//
//  DebterViewController.swift
//  Invoice
//
//  Created by Fady Farag on 10/26/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit

class DebterViewController: UIViewController {
    
    var debterName: String = "Untitled"
    var rowSelected: Int?
    fileprivate var selectedRow: Int?
    
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var due: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = debterName
        navigationController?.navigationBar.prefersLargeTitles = true
        
        amount.text = "$\(rowSelected! * 124) "
        due.text = "$\(rowSelected! * 140) "
    }

}
