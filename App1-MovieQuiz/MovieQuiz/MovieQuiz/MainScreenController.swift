//
//  MainScreenController.swift
//  MovieQuiz
//
//  Created by Nguyen Tran on 3/11/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import MessageUI
import UIKit

class MainScreenController : UIViewController, MFMailComposeViewControllerDelegate{
    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeBackground(input: "bg4")
        imgView.image = UIImage(named: "icon1")
    }
    
   
    //change background
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
    
    
    //Set Start Button -> go to category screen
    @IBAction func startBttn(_ sender: Any) {
        let mainNavigationController = storyboard?.instantiateViewController(withIdentifier:  "MainNavigationController") as! MainNavigationController
        
        present(mainNavigationController, animated: true, completion: nil)
    }
    
    //Set About Button -> go to about screen
    @IBAction func AboutBttn(_ sender: Any) {
        let aboutNavigationController = storyboard?.instantiateViewController(withIdentifier:  "AboutNavigationController") as! AboutNavigationController
        
        present(aboutNavigationController, animated: true, completion: nil)
    }
    
    //feedback action
    @IBAction func feedBack(_ sender: Any) {
        let mailComposeViewController = configureMailComposer()
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeViewController, animated: true, completion: nil)
        }else{
            print("Can't send email")
        }
    }

    //Configure Mail Composer
    func configureMailComposer() -> MFMailComposeViewController{
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients(["nguyentran.dev@gmail.com"])
        mailComposeVC.setSubject("Feedback")
        mailComposeVC.setMessageBody("Text Body", isHTML: false)
        return mailComposeVC
    }
    
    //mail Compose Controlelr
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
