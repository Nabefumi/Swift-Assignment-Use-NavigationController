//
//  FriendsCollectionViewController.swift
//  Assignment2
//
//  Created by Takafumi Watanabe on 2021-10-13.
//

import UIKit

final class FriendsCollectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    static func instantiate() -> FriendsCollectionViewController {
        UIStoryboard(name: "Friend", bundle: nil).instantiateInitialViewController() as! FriendsCollectionViewController
    }

    // Section title
    let sectionData  = ["My Account", "Notification", "More"]
    
    let tableData = [ ["Manage profile", "Payment"], ["Notification", "Promothinal Notification"], ["Contact Us", "Log Out"]]

    @IBOutlet weak var friendsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsTableView.dataSource = self
        friendsTableView.delegate = self
        friendsTableView.frame = view.frame
        
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
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Friendscell", for: indexPath)
        // ↓修正
        cell.textLabel?.text = tableData[indexPath.section][indexPath.row]
        // cell.textLabel?.text = tableData[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
