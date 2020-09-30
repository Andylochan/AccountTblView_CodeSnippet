//
//  ViewController.swift
//  AccountTableviewTest
//
//  Created by Andy Lochan on 9/23/20.
//  Copyright © 2020 Andy Lochan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var table: UITableView!
    
    private let options = [
        ["Wallet", "Delivery Zones", "Refer a friend"],
        ["FAQs", "Contact Support", "Sign Out"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)        
        table.dataSource = self
        table.sectionHeaderHeight = 60.0
        
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        footer.backgroundColor = .white
        table.tableFooterView = footer
    }
    
    func a() {
        print("Testcase: Function a() called")
    }

}

//MARK: - TableView DataSource Methods
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {return "Account"}
        if section == 1 {return "Help"}
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath)
            as! MyTableViewCell

        let dataSection = options[indexPath.section][indexPath.row]
        
        cell.configure(with: dataSection)
        cell.delegate = self
        return cell
    }
}

//MARK: - TableView Delegate
extension ViewController: MyTableViewCellDelegate {
    
    func didTapButton(with title: String) {

        switch title {
        case options[0][0]:
            print("Wallet pressed")
        case options[0][1]:
            print("Delivery Zone pressed")
            a()
        case options[0][2]:
            print("Referral pressed")
        case options[1][0]:
            print("FAQs")
        case options[1][1]:
            print("Contact Support pressed")
        case options[1][2]:
            print("Signout")
        default:
            print("Invalid btn press")
        }
    }
    
}

