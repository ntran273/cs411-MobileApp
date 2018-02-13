//
//  ConversionViewController.swift
//  WorldTroller
//
//  Created by Nguyen Tran on 1/29/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import UIKit

class ConversionViewController : UIViewController, UITextFieldDelegate {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var isreallyLabel: UILabel!
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let number = numberFormatter.number(from: text) {
            fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
        }else{
            fahrenheitValue = nil
        }
    }
    
    //Tap Recognizer
    @IBAction func dismissKeyboard(_ sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    @IBOutlet var celsiuslabel: UILabel!
    var fahrenheitValue: Measurement<UnitTemperature>?{
        didSet{
            updateCelsiusLabel()
        }
    }
    
    //Check if there is a Fahrenheit value, convert it to equivalent in Celsius, if not return null
    var celsiusValue: Measurement<UnitTemperature>?{
        if let fahrenheitValue = fahrenheitValue{
            return fahrenheitValue.converted(to: .celsius)
        }else{
            return nil
        }
    }
    
    //Number formatter
    let numberFormatter: NumberFormatter = {
        let currentLocale = Locale.current
        let isMetric = currentLocale.usesMetricSystem
        let currencySymbol = currentLocale.currencySymbol
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    //update celsiusLabel
    func updateCelsiusLabel(){
        if let celsiusValue = celsiusValue{
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        }else{
            celsiusLabel.text = "???"
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
//        let replacementTextHasDecimalSeparator = string.range(of: ".")

        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCelsiusLabel()
        print("ConversionViewController loaded its view");
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        print("ConversionViewController's view will appear...");
        

        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        if(hour > 6 && hour < 19){
            view.backgroundColor = UIColor.white
        }else{
            view.backgroundColor = UIColor.black
            isreallyLabel.textColor = UIColor.white
            print(hour)
        }
        
        
    }
    

    
    
    
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated);
//        print("ConversionViewController's view did appear...");
//
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewDidAppear(animated);
//        print("ConversionViewController's view will disappear...");
//
//    }
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidAppear(animated);
//        print("ConversionViewController's view did disappear...");
//
//    }
}

