//
//  SignInViewController.swift
//  Invoice
//
//  Created by Fady Farag on 9/29/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) { (user, error) in
                          
                  if error != nil {
//                     print(error)
                  } else {
                      print("Logged In successfully.")
                      self.performSegue(withIdentifier: "goToMainMenu", sender: self)
                  }
              }
    }
    
}
