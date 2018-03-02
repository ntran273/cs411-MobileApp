//
//  ViewController.swift
//  theQuizApp
//
//  Created by Nguyen Tran on 1/22/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var LabelCheck:UILabel!
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var PercentLabel: UILabel!
    @IBOutlet var WrongLabel: UILabel!
    @IBOutlet var CorrectLabel: UILabel!
    @IBOutlet var ScoreLabel: UILabel!
    @IBOutlet var Next: UIButton!
    
    let questions: [String] = [
        "What is 7+7?",
        "Who invented C ?",
        "What is cognac made from?",
        "Who developed Linux?",
        "We elect a President for how many years?",
        "Who was the first President?"
    ]
    
    let answers: [String] = [
        "14",
        "Dennis Ritchie",
        "Grapes",
        "Linus Torvalds",
        "4",
        "Washington"
        
    ]
    var currentQuestionIndex: Int = 0
    var score: Int = 0
    var correctqty: Int = 0
    var wrongqty: Int = 0
    var percentWin: Double = 0.00
    
    //Action show next question
    @IBAction func showNextQuestion(_ sender: UIButton){
        Hide()
        currentQuestionIndex += 1
       
        //Reset after showing all questions
        if currentQuestionIndex == questions.count {
            reset()
            Next.setTitle("Next Question ➡️", for: .normal)
            Next.backgroundColor = UIColor.yellow

        }
        if currentQuestionIndex == questions.count - 1{
            Next.setTitle("👉 Done !!! Want To Play More? 👈", for: .normal)
            Next.backgroundColor = UIColor.yellow
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        
        //Text field is enabled after click show next question
        textField.isUserInteractionEnabled = true;
        textField.text = "";
    }
    
    //Check Answer
    //Call unhide function
    //If the textfield input matches the answer, set labelcheck correct, its color and increase right quantities, else set labelcheck wrong and show correct answer and increase wrong quantity answers
    func checkAnswer(){
        unHide();
        let answer: String = answers[currentQuestionIndex]
        if (answer == textField.text){
            LabelCheck.text = "✅ Correct!!!"
            LabelCheck.textColor = UIColor.orange
            answerLabel.text = "💪😄👍"
            correctqty += 1
            score += 1
        }else{
            LabelCheck.text = "❌ Wrong!!!"
            LabelCheck.textColor = UIColor.red
            answerLabel.text = "Correct Answer: \(answers[currentQuestionIndex])"
            answerLabel.textColor = UIColor.purple
            wrongqty += 1
        }
    }
    
    //Hide Label Check, nextquestions, answerlabel
    func Hide(){
        LabelCheck.isHidden = true
        answerLabel.isHidden = true
        Next.isHidden = true
    }
    
    //Unhide Label Check, show next questions, and Answer Label
    func unHide(){
        LabelCheck.isHidden = false
        answerLabel.isHidden = false
        Next.isHidden = false
    }
    
    //Show info Correct Answer, Wrong Answer, Correct, Incorrect
    func showInfo(){
        ScoreLabel.text = "💯 Score: \(score) / \(questions.count)"
        CorrectLabel.text = "✅ Correct: \(correctqty)"
        WrongLabel.text = "❌ Wrong: \(wrongqty)"
        let percent: Double = ((Double(correctqty)/Double(questions.count))*100)
        PercentLabel.text = "🏆 Winning Percentage: \(numberFormatter.string(from: NSNumber(value: percent) ) ?? "0")"
    }
    
    //Reset Function - reset index, score, correctqty, wrongqty, percentwin, and show info
    func reset(){
        currentQuestionIndex = 0
        score = 0
        correctqty = 0
        wrongqty = 0
        percentWin = 0.00
        showInfo()
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    //MARK: UITextFieldDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Hide()
        questionLabel.text = questions[currentQuestionIndex]
        textField.delegate = self
        showInfo();
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
//    @IBAction func dismissKeyboard(_ sender: AnyObject) {
//        textField.resignFirstResponder()
//    }

    //Set clear text field when go to the next question
    @IBAction func AnswerDidBeginEditing(_ sender: Any) {
        textField.text = "";
    }
    
    @IBAction func AnswerDidEndEditing(_ sender: Any) {
        checkAnswer();
        textField.isUserInteractionEnabled = false;
        showInfo();
    }

}

