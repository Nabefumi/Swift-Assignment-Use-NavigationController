//
//  PasswordResetViewController.swift
//  Assignment2
//
//  Created by Takafumi Watanabe on 2021-10-14.
//

import UIKit

class PasswordResetViewController: UIViewController {
    
    var alertController: UIAlertController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func alert(title:String, message:String) {
        alertController = UIAlertController(title: title,
                                   message: message,
                                   preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                       style: .default,
                                       handler: nil))
        present(alertController, animated: true)
    }

    @IBAction func tapButton(_ sender: Any) {
        alert(title: "Request sent",
              message: "Forgot password request successfully sent")
    }
}
