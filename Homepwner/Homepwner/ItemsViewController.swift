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
    
    @IBAction func addNewItem(_ sender:UIButton){
//        let lastRow = tableView.numberOfRows(inSection: 0)
//        let indexPath = IndexPath(row: lastRow, section: 0)
//
//        tableView.insertRows(at: [indexPath], with: .automatic)
        
        let newItem = itemStore.createItem()
        if let index = itemStore.allItems.index(of: newItem){
            let indexPath = IndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func toggleEditingMode(_ sender:UIButton){
        sender.setTitle((isEditing ? "Edit" : "Done"), for: .normal)
        setEditing(!isEditing, animated: true)
        
//        if(isEditing){
//            sender.setTitle("Edit", for: .normal)
//            setEditing(false, animated: true)
//        }else{
//            sender.setTitle("Done", for: .normal)
//            setEditing(true, animated: true)
//        }
    }
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    
}
