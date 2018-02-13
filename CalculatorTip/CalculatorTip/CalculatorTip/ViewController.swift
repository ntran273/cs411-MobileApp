//
//  ViewController.swift
//  CalculatorTip
//
//  Created by Nguyen Tran on 2/12/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
   
    @IBOutlet var title1: UILabel!
    @IBOutlet var textFieldPrice: UITextField!
    @IBOutlet var percentage: UILabel!
    @IBOutlet var sliderPercentage: UISlider!
    @IBOutlet var LabelAmount: UILabel!
    @IBOutlet var TotalAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //sliderPercentage.value = 15
        let valueInterestRate : Float = Float(sliderPercentage.value)
        percentage.text = NSString(format: "%.2f", valueInterestRate) as String + "%"
        textFieldPrice.delegate = self
        
    }
   
    
    @IBAction func sliderPercentageChanged(_ sender: UISlider) {
        let valueInterestRate : Float = Float(sliderPercentage.value)
        percentage.text = NSString(format: "%.2f", valueInterestRate) as String + "%"
    }
    
    @IBAction func displayAmount(_ sender: Any) {
        //Interest rate
        let interestRate : Float = NSString(string: percentage.text!).floatValue / 100
        
        var textFieldFloat: Float? = Float(textFieldPrice.text!)
        let tipAmount = interestRate * textFieldFloat!
        var textfieldDouble: Double? = Double(textFieldPrice.text!)
        let finalAmount = Double(textfieldDouble!) * Double(1+interestRate)


        if(textFieldPrice.text == ""){
            textFieldFloat = 0
            textfieldDouble = 0
        }
        
        LabelAmount.text = NSString(format: "%.2f", tipAmount) as String        
        TotalAmount.text = NSString(format: "%.2f", finalAmount) as String
    }
   
    func textFieldDidEndEditing(_ textField: UITextField){
        displayAmount(textField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if textField.text != "" || string != "" {
            let res = (textField.text ?? "") + string
            return Double(res) != nil
        }
        return true
    }
    
}

