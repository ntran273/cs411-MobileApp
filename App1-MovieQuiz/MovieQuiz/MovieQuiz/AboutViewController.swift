//
//  AboutViewController.swift
//  MovieQuiz
//
//  Created by Nguyen Tran on 3/11/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//
import UIKit

class AboutViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        changeBackground(input: "bg5")
    }
    
    
    @IBAction func backHandle(_ sender: Any) {
         presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
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
    
  
}
