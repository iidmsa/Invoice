//
//  SignUpViewController.swift
//  Invoice
//
//  Created by Fady Farag on 9/29/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit
import Alamofire

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
         
        let signUpCred = [
            "email": self.emailTextField.text! as String,
            "password": self.passwordTextField.text! as String
        ]
        
        AF.request("http://192.168.0.4:3000/register",
                   method: .post,
                   parameters: signUpCred
            ).validate().response { response in
                    switch response.result {
                        case .success( _):
                            print("OK")
                            self.performSegue(withIdentifier: "goToMainSignUp", sender: self)
                            break
                        case .failure(_):
                            print("Error")
                            break
                    }
             }
    }
}
