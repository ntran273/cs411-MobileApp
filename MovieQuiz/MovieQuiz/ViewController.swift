//
//  ViewController.swift
//  MovieQuiz
//
//  Created by Nguyen Tran on 2/26/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var yearAnswer: UILabel!
    @IBOutlet var authorAnswer: UILabel!
    @IBOutlet var titleAnswer: UILabel!
    @IBOutlet var yearTextField: UITextField!
    @IBOutlet var authorTextField: UITextField!
    @IBOutlet var titleTextField: UITextField!
    
    let listImages: [String] = [
        "img1.png",
        "img2.png",
        "img3.png"
    ]
    let titles: [String] = [
        "Wonder Woman",
        "The Fate of the Furious",
        "Maleficent"
    ]
    let authors: [String] = [
        "a",
        "b",
        "c"
    ]
    let years: [String] = [
        "2017",
        "2017",
        "2014"
    ]
    
    var currentIndex: Int = 0
    var score: Int = 0
    
    func checkAnswer(){
        
        let titleAns: String = titles[currentIndex]
        let authAns: String = authors[currentIndex]
        let yrAns: String = years[currentIndex]
        
        if(titleAns != titleTextField.text){
            titleAnswer.text = "Correct Answer: \(titleAns)"
        }
        else if(authAns != authorTextField.text){
            authorAnswer.text = "Correct Answer: \(authAns)"
        }
        else if(yrAns != yearTextField.text){
            yearAnswer.text = "Correct Answer: \(yrAns)"
        }
        else if (titleAns == titleTextField.text && authAns == authorTextField.text && yrAns == yearTextField.text){
            score += 1
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgView.image = UIImage(named: listImages[currentIndex] )
        titleTextField.delegate = self
        authorTextField.delegate = self
        yearTextField.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        yearTextField.resignFirstResponder()
        authorTextField.resignFirstResponder()
        titleTextField.resignFirstResponder()
    }
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentIndex += 1
        
        if currentIndex == titles.count{
            currentIndex = 0
        }
        imgView.image = UIImage(named: listImages[currentIndex] )

        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    


}

