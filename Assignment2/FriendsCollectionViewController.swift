//
//  FriendsCollectionViewController.swift
//  Assignment2
//
//  Created by Takafumi Watanabe on 2021-10-13.
//

import UIKit

class FriendsCollectionViewController: UICollectionViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Section title
    let sectionData  = ["A", "B", "C","D", "F", "G", "H", "K", "M", "N"]
    
    let tableData = [ ["Alexander Valley", "Anderson Valley", "Atlas Peak"], ["Bennett Valley"], ["Calistoga", "Chalk Hill"], ["Diamond Mountain", "Dry Creek Valley"], ["Fort Ross / Seaview"], ["Green Valley"], ["Howell Mountain"], ["Knights Valley"], ["Los Carneros", "Liam Valley"], ["mike Valley"], ["nik Valley"]]

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
