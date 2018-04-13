//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Nguyen Tran on 2/12/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var itemStore: ItemStore!
    var imageStore: ImageStore!

    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        // Create a new Item and add it to the store
        let newItem = itemStore.createItem()
        
        // Figure out where that item is in the array
        if let index = itemStore.allItems.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            
            // Insert this new row into the table.
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "showItem" segue
        switch segue.identifier {
        case "showItem"?:
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                
                // Get the item associated with this row and pass it along
                let item = itemStore.allItems[row]
                let detailViewController
                    = segue.destination as! DetailViewController
                detailViewController.item = item as! Item
                detailViewController.imageStore = imageStore
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let imageName = "wood"
        let image = UIImage(named: imageName)

        let backView = UIImageView(image: image!)
        backView.contentMode = .scaleAspectFill

        let color = UIColor(red: 1, green: 0.95, blue: 0.85, alpha: 1)
        tableView.backgroundColor = color

        tableView.backgroundView = backView
        tableView.backgroundView?.isOpaque = false
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
        
        
    }
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        // Update the model
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            
            if let baseItem = item as? Item {
                let title = "Delete \(baseItem.name)?"
                let message = "Are you sure you want to delete this item?"
                
                let ac = UIAlertController(title: title,
                                           message: message,
                                           preferredStyle: .actionSheet)
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                ac.addAction(cancelAction)
                
                let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
                                                 handler: { (action) -> Void in
                                                    // Remove the item from the store
                                                    self.itemStore.removeItem(baseItem)
                                                    
                                                    //Remove the item's image from the image store
                                                    self.imageStore.deleteImage(forKey: baseItem.itemKey)
                                                    
                                                    // Also remove that row from the table view with an animation
                                                    self.tableView.deleteRows(at: [indexPath], with: .automatic)
                })
                ac.addAction(deleteAction)
                
                // Present the alert controller
                present(ac, animated: true, completion: nil)
            }
           
        }
    }
    
    //Chapter 11 - Bronze Challenge - Rename Delete to Remove
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Remove"
    }
    
    //Chapter 11 - Silver Challenge - Preventing reordering -- last row cannot be reordered
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == (itemStore.allItems.count - 1) {
            return false
        }
        return true
    }
    
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == (itemStore.allItems.count - 1) {
            return false
        }
        return true
    }
    
    //Chapter 11 - Gold Challenge - Really Preventing reordering - rows cannot be dragged below last
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestIndexPath: IndexPath) -> IndexPath {
        if proposedDestIndexPath.row == (itemStore.allItems.count - 1) {
            var allowedPath = proposedDestIndexPath
            allowedPath.row -= 1
            return allowedPath
        }
        return proposedDestIndexPath
    }
    
    // Set constant row no editing mode
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if indexPath.row == (itemStore.allItems.count - 1) {
            return .none
        }
        return .delete
    }
    
    //Chap14
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData();
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let item = itemStore.allItems[indexPath.row]
        //10:silver
        if indexPath.row == (itemStore.allItems.count - 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UINoItemViewCell", for: indexPath)
            if let stubItem = item as? zeroItem {
                cell.textLabel?.text = stubItem.name
                cell.textLabel?.font = UIFont(name:"Arial", size: 18)
                cell.textLabel?.textAlignment = .center
            }
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
            
            if let baseItem = item as? Item {
                let font = UIFont(name:"Arial", size: 20)
                
                cell.nameLabel.text = baseItem.name
                cell.nameLabel.font = font
                cell.serialNumberLabel.text = baseItem.serialNumber
                cell.valueLabel.text = "\(baseItem.valueInDollars)$"
                
                //Chapter 12 - Bronze Challenge - Cell Colors
                if baseItem.valueInDollars > 50 {
                    cell.valueLabel.textColor = UIColor.green
                } else {
                    cell.valueLabel.textColor = UIColor.red
                }
                cell.valueLabel.font = font
            }
            let backColor = UIColor(white: 1, alpha: 0.7)
            cell.backgroundColor = backColor
            
            return cell
        }
    
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
}

