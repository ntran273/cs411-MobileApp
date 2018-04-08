//
//  ViewController.swift
//  TicTacToe
//
//  Created by Nguyen Tran on 3/19/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var result: UILabel!
    var player = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    var gameIsActive = true
    var score = 0
    var score2 = 0
    let winningCombinations = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]

    ]
    
    @IBAction func action(_ sender: AnyObject) {
        if (gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag-1] = player
            if (player == 1){
                sender.setImage(UIImage(named: "redcross"), for: UIControlState())
                player = 2
            }
            else{
                sender.setImage(UIImage(named: "nough"), for: UIControlState())
                player = 1
            }
        }
        
        //Check Combination
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                gameIsActive = false
    
                if gameState[combination[0]] == 1 {
                    score += 1
                    result.text = plyer1Name.text! + " HAS WON Score: \(score)/\(score2)"
                    restart()
                    
                }
                else{
                    score2 += 1
                    result.text = plyer2Name.text! + " HAS WON Score: \(score)/\(score2)"
                    restart()
                }
                result.isHidden = false
            }
        }
        
        gameIsActive = false

        for i in gameState
        {
            if i == 0{
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false {
            result.text = "IT WAS A DRAW"
            result.isHidden = false
            restart()
        }
        

    }
    
    func restart(){
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        player = 1
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    
    
    @IBOutlet var plyer1Name: UITextField!
    @IBOutlet var plyer2Name: UITextField!
   
    @IBOutlet var labelPlayer1: UILabel!
    @IBOutlet var labelPlayer2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    @IBAction func player2Name(_ sender: UITextField){
        labelPlayer2.text = plyer2Name.text
        plyer2Name.isEnabled = false
    }
    
    @IBAction func player1Name(_ sender: UITextField) {
        labelPlayer1.text = plyer1Name.text
        plyer1Name.isEnabled = false;
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
   
}

