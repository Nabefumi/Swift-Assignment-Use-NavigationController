//
//  ViewController.swift
//  Assignment2
//
//  Created by Takafumi Watanabe on 2021-10-07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delete text "Back" Button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

}

