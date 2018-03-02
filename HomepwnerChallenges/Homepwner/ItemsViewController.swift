//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Nguyen Tran on 2/12/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController{
    var itemStore: ItemStore!
    var sections = ["Inexpensive", "Expensive"]
    
    //Bronze Challenge
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return itemStore.inexpensiveItems(cutoffPrice: 50).count
        } else {
            return itemStore.expensiveItems(cutoffPrice: 50).count
        }
    }
    
    override func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)

        let backColor = UIColor(white: 1, alpha: 0.7)
        let itemList: [Item]
        
        //Bronze Challenge
        if indexPath.section == 0 {
            itemList = itemStore.inexpensiveItems(cutoffPrice: 50)
        } else {
            itemList = itemStore.expensiveItems(cutoffPrice: 50)
        }
        
        let item = itemList[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        cell.detailTextLabel?.backgroundColor = backColor
        cell.textLabel?.font  = UIFont(name:"Arial", size: 25);
        cell.textLabel?.backgroundColor = backColor
        cell.backgroundColor = backColor
        
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        tableView.insertSections([0,1], with: UITableViewRowAnimation.left)
        tableView.rowHeight = 60
        
        let backView = UIImageView(image: UIImage(named: "bg.png"));
        backView.contentMode = .scaleAspectFit
        
        let color = UIColor(red: 1, green: 0.95, blue: 0.85, alpha: 1)
        tableView.backgroundColor = color

        tableView.backgroundView = backView
        tableView.backgroundView?.isOpaque = false
        
        let footerView = UITextView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        footerView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15)
        footerView.textAlignment = .center
        footerView.autoresizingMask = [.flexibleWidth, .flexibleLeftMargin, .flexibleRightMargin]
      
        footerView.text = "No more items!"
        footerView.font = UIFont(name:"Arial", size: 20)
        tableView.tableFooterView = footerView
    }
    
    override public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    override public func numberOfSections(in tableView: UITableView) -> Int  {
        return sections.count
    }
    
    //CellForRowAt- if we add the last cell, we are going to say no more item
}
