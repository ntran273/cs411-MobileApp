//
//  ChooseDateViewController.swift
//  Homepwner
//
//  Created by Nguyen Tran on 4/7/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import UIKit

class ChooseDateViewController : UIViewController {
    //Chapter 14: Gold Challenge
    
    @IBOutlet var datePicker: UIDatePicker!
    var item: Item!

    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = .date
        datePicker.date = item.dateCreated
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        item.dateCreated = datePicker.date
    }
}
