//
//  ProfileViewController.swift
//  Assignment2
//
//  Created by Takafumi Watanabe on 2021-10-07.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Section title
    let sectionData  = ["My Account", "Notification", "More"]
    
    let tableData = [ ["Manage profile", "Payment"], ["Notification", "Promothinal Notification"], ["Contact Us", "Log Out"]]
    
    let iconDate = [["person", "list.bullet.rectangle"], ["bell","bell"], ["person.badge.plus", "rectangle.portrait.and.arrow.right"]]
    
    @IBOutlet weak var profileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileTableView.dataSource = self
        profileTableView.delegate = self
        profileTableView.frame = view.frame
//        profileTableView.tableHeaderView = CustomGlobalHeaderView()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // ↓修正
         return tableData[section].count
         // return tableData.count
     }
    
    // Return section numbers
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionData.count
    }
    
//    // Return section title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionData[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // StoryBoradで定義したTableViewCellを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Mycell", for: indexPath)
        // ↓修正
        cell.textLabel?.text = tableData[indexPath.section][indexPath.row]
        // cell.textLabel?.text = tableData[indexPath.row]
        
        cell.imageView!.image = UIImage(systemName: "exclamationmark.shield.fill")
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator // ここで「>」ボタンを設定

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
