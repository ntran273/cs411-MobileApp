//
//  ViewController.swift
//  MovieQuiz
//
//  Created by Nguyen Tran on 2/26/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var movieName: UILabel!
    @IBOutlet var checkAns: UILabel!
    @IBOutlet var titleAnswer: UILabel!

    @IBOutlet var detailView: UIView!
    @IBAction func hintAction(_ sender: UIButton) {
        let titleAns: String = allMovies.movies[currentIndex].title
        let answer = Answer(titleAns: titleAns)
        titleTextField.placeholder = answer
    }
    @IBOutlet var titleTextField: UITextField!
    
    @IBOutlet var nextQuestion: UIButton!
    @IBOutlet var stackView: UIView!
    var allMovies = MovieStore()
//    var movie: Movie! {didSet {
//        navigationItem.title = movie.type}
//    }
    
    var name:String = ""
    var type: String = ""
    var currentIndex: Int = 0
    var score: Int = 0
    let textColor1 = UIColor.green
    let textfieldborderColor = UIColor.clear
   
    
    //genre
    var actionType = [Movie]()
    var animationType = [Movie]()
    var crimeType = [Movie]()
    var comedyType = [Movie]()
    var dramaType = [Movie]()
    var fantasyType = [Movie]()
    var horrorType = [Movie]()
    var scifiType = [Movie]()
    
    //Actor
    var bradType = [Movie]()
    var jackieType = [Movie]()
    var jasonType = [Movie]()
    var tomcruiseType = [Movie]()
    
    //Year
    var type80 = [Movie]()
    var type90 = [Movie]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set current index = 0
        currentIndex = 0
        
        //Append movies based on type
        appendMovies();
        
        //Hide
        Hide()
    
        //set navigation title equals name passing from the data type
        navigationItem.title = name
        
        //load image by type
        loadMoviePhoto(type: name)
        
        //load Score
        loadScore(input: name)
        
        //Hide next question button
        nextQuestion.isHidden = true
        
        //Set Score Label background
        //changeBackground(input: "bcd")
        scoreBackground(input: "bcd")
    }
    
    //Function change background by type
    func scoreBackground(input: String){
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: input)?.draw(in: self.view.bounds)
        
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext()
            self.scoreLabel.backgroundColor = UIColor(patternImage: image)
        }else{
            UIGraphicsEndImageContext()
            debugPrint("Image not available")
        }
    }
    
    //Function change background by type
    func changeBackground(input: String){
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: input)?.draw(in: self.view.bounds)
        
        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        }else{
            UIGraphicsEndImageContext()
            debugPrint("Image not available")
        }
    }
    
    //Function Append Movies by types
    func appendMovies(){
        for index in 0..<allMovies.movies.count {
            switch allMovies.movies[index].type {
            case "Animation":
                animationType.append(allMovies.movies[index])
            case "Crime":
                crimeType.append(allMovies.movies[index])
            case "Drama":
                dramaType.append(allMovies.movies[index])
            case "Fantasy":
                fantasyType.append(allMovies.movies[index])
            case "Sci-Fi":
                scifiType.append(allMovies.movies[index])
            case "Brad-Pitt":
                bradType.append(allMovies.movies[index])
            case "Jason Statham":
                jasonType.append(allMovies.movies[index])
            case "Tom Cruise":
                tomcruiseType.append(allMovies.movies[index])
            case "Action" :
                actionType.append(allMovies.movies[index])
            case "Comedy" :
                comedyType.append(allMovies.movies[index])
            case "Horror" :
                horrorType.append(allMovies.movies[index])
            case "Jackie Chan":
                jackieType.append(allMovies.movies[index])
            case "80s":
                type80.append(allMovies.movies[index])
            case "90s":
                type90.append(allMovies.movies[index])
            default:
                break;
            }

        }
    }
    
    //Function return Answer string
    func Answer( titleAns: String) -> String{
        var titleAns = titleAns
        //titleAns = allMovies.movies[currentIndex].title
        switch name{
        case "Animation":
            titleAns = animationType[currentIndex].title
        case "Crime":
            titleAns = crimeType[currentIndex].title
        case "Drama":
            titleAns = dramaType[currentIndex].title
        case "Fantasy":
            titleAns = fantasyType[currentIndex].title
        case "Sci-Fi":
            titleAns = scifiType[currentIndex].title
        case "Brad-Pitt":
            titleAns = bradType[currentIndex].title
        case "Jason Statham":
            titleAns = jasonType[currentIndex].title
        case "Tom Cruise":
            titleAns = tomcruiseType[currentIndex].title
        case "Action" :
            titleAns = actionType[currentIndex].title
        case "Comedy" :
            titleAns = comedyType[currentIndex].title
        case "Horror" :
            titleAns = horrorType[currentIndex].title
        case "Jackie Chan":
            titleAns = jackieType[currentIndex].title
        case "80s":
            titleAns = type80[currentIndex].title
        case "90s":
            titleAns = type90[currentIndex].title
        default:
            break;
        }
        return titleAns
    }
    
    //Function load movies photo at the begining
    func loadMoviePhoto(type: String){
        switch type{
        case "Animation":
            changeBackground(input: "animation1")
            imgView.image = UIImage(named: animationType[0].images)
        case "Crime":
            changeBackground(input: "bg5")
            imgView.image = UIImage(named: crimeType[0].images)
        case "Drama":
            changeBackground(input: "bg6")
            imgView.image = UIImage(named: dramaType[0].images)
        case "Fantasy":
            changeBackground(input: "bg4")
            imgView.image = UIImage(named: fantasyType[0].images)
        case "Sci-Fi":
            changeBackground(input: "scifi1")
            imgView.image = UIImage(named: scifiType[0].images)
        case "Brad-Pitt":
            changeBackground(input: "braddpitt1")
            imgView.image = UIImage(named: bradType[0].images)
        case "Jason Statham":
            changeBackground(input: "bg9")
            imgView.image = UIImage(named: jasonType[0].images)
        case "Tom Cruise":
            changeBackground(input: "bg7")
            imgView.image = UIImage(named: tomcruiseType[0].images)
        case "Action" :
            changeBackground(input: "bg8")
            imgView.image = UIImage(named: actionType[0].images)
        case "Comedy" :
            changeBackground(input: "bg2")
            imgView.image = UIImage(named: comedyType[0].images)
        case "Horror" :
            changeBackground(input: "horror1")
            imgView.image = UIImage(named: horrorType[0].images)
        case "Jackie Chan":
            changeBackground(input: "bg3")
            imgView.image = UIImage(named: jackieType[0].images)
        case "80s":
            changeBackground(input: "80s1")
            imgView.image = UIImage(named: type80[0].images)
        default:
            changeBackground(input: "90s1")
            imgView.image = UIImage(named: type90[0].images)
            
        }
    }
    
    func loadScore(input: String) {
        switch(input){
        case "Animation":
        scoreLabel.text = "Score: \(score) / \(animationType.count)"
        case "Crime":
        scoreLabel.text = "Score: \(score) / \(crimeType.count)"
        case "Drama":
        scoreLabel.text = "Score: \(score) / \(dramaType.count)"
        case "Fantasy":
        scoreLabel.text = "Score: \(score) / \(fantasyType.count)"
        case "Sci-Fi":
        scoreLabel.text = "Score: \(score) / \(scifiType.count)"
        case "Brad-Pitt":
        scoreLabel.text = "Score: \(score) / \(bradType.count)"
        case "Jason Statham":
        scoreLabel.text = "Score: \(score) / \(jasonType.count)"
        case "Tom Cruise":
        scoreLabel.text = "Score: \(score) / \(tomcruiseType.count)"
        case "Action" :
        scoreLabel.text = "Score: \(score) / \(actionType.count)"
        case "Comedy" :
        scoreLabel.text = "Score: \(score) / \(comedyType.count)"
        case "Horror" :
        scoreLabel.text = "Score: \(score) / \(horrorType.count)"
        case "Jackie Chan":
        scoreLabel.text = "Score: \(score) / \(jackieType.count)"
        case "80s":
        scoreLabel.text = "Score: \(score) / \(type80.count)"
        case "90s":
        scoreLabel.text = "Score: \(score) / \(type90.count)"
        default:
        break
        }
    }
    func MovieTypeCount(inputType : Array<Any>) -> Int {
        
        return inputType.count
    }
    
    //Function Check Answer
    func checkAnswer(){
        //TO DO : Add other types
        let titleAns: String = allMovies.movies[currentIndex].title
        let answer = Answer(titleAns: titleAns)
        let myColor = UIColor.red
        let myColor2 = UIColor.green
       
        unHide()
        if(titleTextField.text == ""){
            titleTextField.text = ""
        }
        if(answer.lowercased() != titleTextField.text?.lowercased()){
            titleTextField.layer.borderColor = myColor.cgColor
            titleTextField.layer.borderWidth = 1.0
        }else{
            titleTextField.layer.borderColor = myColor2.cgColor
            titleTextField.layer.borderWidth = 1.0
        }
        
        let currenttext = titleTextField.text
        if (answer.lowercased() == titleTextField.text?.lowercased()){
            score += 1
            titleTextField.text = "✅ " + currenttext!
            titleAnswer.text = ""
        }else{
            titleTextField.text = "❌ " + currenttext!
            titleAnswer.text = "\(answer)"
            titleAnswer.textColor = textColor1
        }
        print(loadScore(input: name))
        
       // scoreLabel.text = "Score: \(score)"
        loadScore(input: name)
        nextQuestion.isHidden = false
    }
    
    //Hide Label Check, nextquestions, answerlabel
    func Hide(){
        titleAnswer.isHidden = true
        titleTextField.isUserInteractionEnabled = true
    }
    
    //Unhide Label Check, show next questions, and Answer Label
    func unHide(){
        titleAnswer.isHidden = false
    }
    
    //Show next question
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentIndex += 1
        Hide()
        titleTextField.placeholder = ""
        titleTextField.text = ""
        titleTextField.isEnabled = true
        titleTextField.layer.borderColor = UIColor.clear.cgColor
        titleTextField.layer.borderWidth = 1.0
        nextQuestion.isHidden = true

        
        switch name{
        case "Animation":
            if currentIndex == animationType.count{
                currentIndex = 0
                score = 0
            }
            imgView.image = UIImage(named: animationType[currentIndex].images)
        case "Crime":
            if currentIndex == crimeType.count{
                currentIndex = 0
                score = 0
            }
            imgView.image = UIImage(named: crimeType[currentIndex].images)
        case "Drama":
            if currentIndex == dramaType.count{
                currentIndex = 0
                score = 0
            }
            imgView.image = UIImage(named: dramaType[currentIndex].images)
        case "Fantasy":
            if currentIndex == fantasyType.count{
                currentIndex = 0
                score = 0
            }
            imgView.image = UIImage(named: fantasyType[currentIndex].images)
        case "Sci-Fi":
            if currentIndex == scifiType.count{
                currentIndex = 0
                score = 0
            }
            imgView.image = UIImage(named: scifiType[currentIndex].images)
        case "Brad-Pitt":
            if currentIndex == bradType.count{
                currentIndex = 0
                score = 0
            }
            imgView.image = UIImage(named: bradType[currentIndex].images)
        case "Jason Statham":
            if currentIndex == jasonType.count{
                currentIndex = 0
                score = 0
            }
            imgView.image = UIImage(named: jasonType[currentIndex].images)
        case "Tom Cruise":
            if currentIndex == tomcruiseType.count{
                currentIndex = 0
                score = 0
            }
            imgView.image = UIImage(named: tomcruiseType[currentIndex].images)
        case "Action" :
            if currentIndex == actionType.count
            {
                currentIndex = 0
                score = 0
            }
            imgView.image = UIImage(named: actionType[currentIndex].images)
        case "Comedy" :
            if currentIndex == comedyType.count
            {
                currentIndex = 0
                score = 0
            }
            imgView.image = UIImage(named: comedyType[currentIndex].images)
        case "Horror" :
            if currentIndex == horrorType.count{
                currentIndex = 0
                score = 0
            }
            imgView.image = UIImage(named: horrorType[currentIndex].images)
        case "Jackie Chan":
            if currentIndex == jackieType.count{
                currentIndex = 0
                score = 0
            }
            imgView.image = UIImage(named: jackieType[currentIndex].images)
        case "80s":
            if currentIndex == type80.count{
                currentIndex = 0
                score = 0
            }
            imgView.image = UIImage(named: type80[currentIndex].images)
        case "90s":
            if currentIndex == type90.count{
                currentIndex = 0
                score = 0
            }
            imgView.image = UIImage(named: type90[currentIndex].images)
        default:
            break;
        }
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func AnswerDidEndEditing(_ sender: Any) {
        checkAnswer();
        titleTextField.isUserInteractionEnabled = false;
    }
    
    

}

