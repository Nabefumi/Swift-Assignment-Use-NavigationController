//
//  SignUpViewController.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-10-22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    lazy var logo: BaseUIImageView = {
        let iv = BaseUIImageView()
        iv.image = UIImage(named: "appleLogo")
        return iv
    }()
    
    lazy var titleLabel: BaseUILabel = {
       let label = BaseUILabel()
        label.text = "Karen Trip"
        label.textColor = UIColor(hexString: "#425888")
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    lazy var usernameYF: BaseUITextField = {
       let tf = BaseUITextField()
        tf.placeholder = "User name"
        tf.backgroundColor = UIColor.white
        tf.layer.shadowOpacity = 1.0
        tf.layer.shadowColor = UIColor.lightGray.cgColor
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tf.layer.cornerRadius = 25
        return tf
    }()
    
    lazy var emailYF: BaseUITextField = {
       let tf = BaseUITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = UIColor.white
        tf.layer.shadowOpacity = 1.0
        tf.layer.shadowColor = UIColor.lightGray.cgColor
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tf.layer.cornerRadius = 25
        return tf
    }()
    
    lazy var passYF: BaseUITextField = {
       let tf = BaseUITextField()
        tf.placeholder = "Password"
        tf.backgroundColor = UIColor.white
        tf.layer.shadowOpacity = 1.0
        tf.layer.shadowColor = UIColor.lightGray.cgColor
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tf.layer.cornerRadius = 25
        return tf
    }()
    
    lazy var signupButton: BaceUIButtton = {
       let button = BaceUIButtton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = UIColor(hexString: "#58CFC2")
        button.layer.shadowOpacity = 1.0
        button.layer.shadowColor = UIColor.lightGray.cgColor
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.layer.cornerRadius = 25
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle:  .headline)
        button.addTarget(self, action: #selector(signUpHandler), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonStack: VStack = {
       let stack = VStack()
        stack.addArrangedSubview(usernameYF)
        stack.addArrangedSubview(emailYF)
        stack.addArrangedSubview(passYF)
        stack.spacing = 20
        stack.widthAnchor.constraint(equalToConstant: 300).isActive = true
        return stack
    }()
    
    lazy var cpntentStack: VStack = {
        let stack = VStack()
        
        stack.addArrangedSubview(logo)
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(buttonStack)
        stack.addArrangedSubview(signupButton)
        stack.spacing = 50
        stack.alignment = .center
        
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hexString: "#E5E5E5")
        
        view.addSubview(cpntentStack)
        
        NSLayoutConstraint.activate([
            cpntentStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cpntentStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func signUpHandler() {
//        let profileVC = ProfileViewController()
//        self.navigationController?.pushViewController(profileVC, animated: true)
        let vc = TabBarViewController()
        AppRouter.navigate(to: vc)
    }
    
}
