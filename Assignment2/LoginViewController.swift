//
//  LoginViewController.swift
//  Assignment2
//
//  Created by Takafumi Watanabe on 2021-10-07.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Log in"
        
        // Delete text "Back" Button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
}
