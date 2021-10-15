//
//  PasswordResetViewController.swift
//  Assignment2
//
//  Created by Takafumi Watanabe on 2021-10-15.
//

import UIKit

class PasswordResetViewController: UIViewController {

    var alertController: UIAlertController!
    
    @IBOutlet weak var textEmailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Password reset"
        
        // Under line for textMaileField
        textEmailField.setUnderLine()
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
    
    // Alert Message
    @IBAction func alertButton(_ sender: Any) {
        alert(title: "Request sent",
              message: "Forgot password request successfully sent")
    }
}

extension UITextField {
    func setUnderLine() {
        // 枠線を非表示にする
        borderStyle = .none
        let underline = UIView()
        // heightにはアンダーラインの高さを入れる
        underline.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: 0.5)
        // 枠線の色
        underline.backgroundColor = .systemGray5
        addSubview(underline)
        // 枠線を最前面に
        bringSubviewToFront(underline)
    }
}
