//
//  DebtyViewController.swift
//  Invoice
//
//  Created by Fady Farag on 10/12/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit

class DebtyViewController: UIViewController {
    
    var debtyName: String = "Untitled"
    var rowSelected: Int?
    fileprivate var selectedRow: Int?
    
    @IBOutlet weak var amountLeft: UILabel!
    @IBOutlet weak var dueLeft: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = debtyName
        navigationController?.navigationBar.prefersLargeTitles = true
        
        amountLeft.text = "$\(rowSelected! * 124) "
        dueLeft.text = "$\(rowSelected! * 140) "
    }
    


}
