//
//  ProfileEditViewController.swift
//  Assignment2
//
//  Created by Takafumi Watanabe on 2021-10-12.
//

import UIKit

struct Sction {
    let title: String
    let option: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption {
    let titlel: String
    let icon: UIImage?
    let iconBackgroundClro: UIColor
    let handler: (() -> Void)
    let isOn: Bool
}

struct SettingsOption {
    let titlel: String
    let icon: UIImage?
    let iconBackgroundClro: UIColor
    let handler: (() -> Void)
}

class ProfileEditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var editBarButtonItem: UIBarButtonItem!
    
    private let tavleView: UITableView = {
        let table = UITableView(frame:  .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)

        return table
}()

var models = [Sction]()

override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    title = "Profile"
    view.addSubview(tavleView)
    tavleView.dataSource = self 
    tavleView.delegate = self
    tavleView.frame = view.frame
    
    // Edit Button
    editBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editBarButtonTapped(_:)))
    self.navigationItem.rightBarButtonItems = [editBarButtonItem]
    
    // Delete "Back" Button
    self.navigationItem.hidesBackButton = true
}

    func configure() {
        
        models.append(Sction(title: "My account", option: [
            .staticCell(model: SettingsOption(titlel: "Manage profile", icon: UIImage(systemName: "person"), iconBackgroundClro: .systemGreen) {
            }),
            .staticCell(model: SettingsOption(titlel: "Payment", icon: UIImage(systemName: "list.bullet.rectangle"), iconBackgroundClro: .systemGreen) {
            })
        ]))
        models.append(Sction(title: "Notification", option: [
            .switchCell(model: SettingsSwitchOption(titlel: "Notification", icon: UIImage(systemName: "bell"), iconBackgroundClro: .systemGreen, handler: {
            }, isOn: true)),
            .switchCell(model: SettingsSwitchOption(titlel: "Promothinal Notification", icon: UIImage(systemName: "bell"), iconBackgroundClro: .systemGreen, handler: {
            }, isOn: true))
        ]))
        
        models.append(Sction(title: "More", option: [
            .staticCell(model: SettingsOption(titlel: "Friends", icon: UIImage(systemName: "person.badge.plus"), iconBackgroundClro: .systemGreen) {
                print("Tapped thaad cell")
            }),
            .staticCell(model: SettingsOption(titlel: "Log Out", icon: UIImage(systemName: "rectangle.portrait.and.arrow.right"), iconBackgroundClro: .systemGreen) {
            })
        ]))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].option.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].option[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.identifier,
                for: indexPath
            ) as? SettingTableViewCell else{
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
            
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as? SwitchTableViewCell else{
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].option[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
        if (indexPath.section == 2 && indexPath.row == 0) {
            let nextViewController = FriendsViewController.instantiate()
            navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            print("You can not page transition yet")
        }
        // タップされたセルの行番号を出力
        print("\(indexPath.section)番目のセクション(0始まり)の\(indexPath.row)番目の行(0始まり)が選択されました。")
    }
    
    // Processing when the "Edit" button is pressed
    @objc func editBarButtonTapped(_ sender: UIBarButtonItem) {
        print("Tapped Edit Button")
        
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "next") as! SettingProfileTableViewController
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
