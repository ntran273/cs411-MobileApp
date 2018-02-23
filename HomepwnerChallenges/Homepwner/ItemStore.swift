//
//  ItemStore.swift
//  Homepwner
//
//  Created by Nguyen Tran on 2/12/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import UIKit

class ItemStore{
    var allItems = [Item]()
    
    init(){
        for _ in 0..<5 {
            createItem()
        }
    }
    
    //Check item expensive and put it to list array
    func expensiveItems(cutoffPrice: Int) -> [Item]{
        var list = [Item]()
        for item in allItems{
            if(item.valueInDollars > cutoffPrice){
                list.append(item)
            }
        }
        return list
    }
    
    func inexpensiveItems(cutoffPrice: Int) -> [Item]{
        var list = [Item]()
        for item in allItems{
            if(item.valueInDollars <= cutoffPrice){
                list.append(item)
            }
        }
        return list
    }
    
    @discardableResult func createItem() -> Item{
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        return newItem
    }
}
