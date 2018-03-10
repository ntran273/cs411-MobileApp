//
//  ItemCell.swift
//  MovieQuiz
//
//  Created by Nguyen Tran on 3/6/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell{
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var cellView: UIView!
    @IBOutlet var imageType: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
    }
}
