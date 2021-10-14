//
//  SettingProfileTableViewController.swift
//  Assignment2
//
//  Created by Takafumi Watanabe on 2021-10-13.
//

import UIKit

class SettingProfileTableViewController: UIViewController {
    var doneBarButtonItem: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneBarButtonTapped(_:)))
        self.navigationItem.rightBarButtonItems = [doneBarButtonItem]
    }
    @objc func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        print("Tapped Done Button")
        
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "done") as! ProfileEditViewController
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
