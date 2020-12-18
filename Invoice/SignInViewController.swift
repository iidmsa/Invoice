//
//  SignInViewController.swift
//  Invoice
//
//  Created by Fady Farag on 9/29/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit
import Alamofire
//import Firebase

class SignInViewController: UIViewController {
    
    struct Login: Encodable {
        let username: String
        let password: String
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        
        let loginCred = [
            "email": self.emailTextField.text! as String,
            "password": self.passwordTextField.text! as String
        ]
        
        AF.request("http://192.168.0.4:3000/login",
                   method: .put,
                   parameters: loginCred
            ).validate().response { response in
                    switch response.result {
                        case .success( _):
                            print("OK")
                            self.performSegue(withIdentifier: "goToMainLogin", sender: self)
                            break
                        case .failure(_):
                            print("Error")
                            break
                    }
             }
    }
}
