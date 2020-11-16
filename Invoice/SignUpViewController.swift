//
//  SignUpViewController.swift
//  Invoice
//
//  Created by Fady Farag on 9/29/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit
//import Firebase

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func SignUpButtonPressed(_ sender: Any) {
//        Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
//
//                if error != nil {
//                    print(error!)
//                } else {
//                    print("Sign Up successfully.")
//                    self.performSegue(withIdentifier: "goToMenu", sender: self)
//                }
//        }
        
    }
    
    
    
}
