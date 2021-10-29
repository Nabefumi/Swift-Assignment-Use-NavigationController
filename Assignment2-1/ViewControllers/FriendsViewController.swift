//
//  FriendsViewController.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-10-22.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    let data = DataProvider.makeData()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.parent?.title = "Friends"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
//        title = "Friends"
        
        tableView.register(FriendsCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionData = data[section]
        return sectionData.1.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FriendsCell
//        cell.label.text = "there is one cell \(indexPath.row)"
        
        let cellData = data[indexPath.section].1[indexPath.row]

        cell.updateView(
            nickName: cellData.nickName,
            age: cellData.age,
            location: cellData.location,
            image: cellData.image
        )
        
//        cell.nickNameLabel.text = cellData.nickName
//        cell.locationLabel.text = cellData.location
//        cell.ageLabel.text = cellData.age
//        cell.avatarView.image = cellData.image
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellData = data[indexPath.section].1[indexPath.row]
        
        
        let alertViewContoroller = UIAlertController(title: cellData.nickName, message: "You select this person", preferredStyle: .alert)
        let actin = UIAlertAction(title: "Close", style: .cancel) { action in
            print("completion happened")
        }
        alertViewContoroller.addAction(actin)
        self.navigationController?.present(alertViewContoroller, animated: true, completion: nil)
    }

}
