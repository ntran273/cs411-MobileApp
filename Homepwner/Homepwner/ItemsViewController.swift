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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let item = itemStore.allItems[indexPath.row]
        
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        
        return cell
    }
    
    
}
