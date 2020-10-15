//
//  ViewController.swift
//  Invoice
//
//  Created by Fady Farag on 9/28/20.
//  Copyright © 2020 POS_SYSTEM. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    var animationView: AnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func unWindToMainMenu(_ sender: UIStoryboardSegue) {
        
    }
    
    func initAnimation() {
        animationView = .init(name: "9825-loading-screen-loader-spinning-circle")
        animationView?.frame = CGRect(x: 40, y: 0, width: 300, height: 500)
        animationView?.contentMode = .scaleAspectFit
        animationView?.loopMode = .loop
        view.addSubview(animationView!)
        animationView?.play()
    }


   
}

