//
//  customTextField.swift
//  Homepwner
//
//  Created by Nguyen Tran on 4/7/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import UIKit

class customTextField: UITextField {
    
    override func becomeFirstResponder() -> Bool {
        let a = super.becomeFirstResponder()
        self.borderStyle = .none
        return a
    }
    
    override func resignFirstResponder() -> Bool {
        self.borderStyle = .line
        super.resignFirstResponder()
        self.borderStyle = .line
        return true
    }
}
