//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Nguyen Tran on 2/26/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    @IBOutlet var nameField: UITextField!
    @IBOutlet var serialNumberField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    
    //Function take picture
    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        
        //Chapter 15: Bronze Chllagen Editing an image
        imagePicker.allowsEditing = true

        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
            
            let cameraOverlay = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            imagePicker.cameraOverlayView = cameraOverlay
            //Chapter 15: Gold Challenge Overlayview
//            let overlayView = UIView(frame: imagePicker.cameraOverlayView!.frame)
            
            
//            let crosshairLabel = UILabel()
//            crosshairLabel.text = "+"
//            crosshairLabel.font = UIFont.systemFont(ofSize: 50)
//            crosshairLabel.translatesAutoresizingMaskIntoConstraints = false
//            overlayView.addSubview(crosshairLabel)
//
//            crosshairLabel.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor).isActive = true
//            crosshairLabel.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor).isActive = true
//
//            // To avoid blocking the underneath default camera controls
//            overlayView.isUserInteractionEnabled = false
//
//            imagePicker.cameraOverlayView = overlayView
            
        }else{
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.delegate = self
        
        //Place image picker on the screen
        present(imagePicker, animated: true, completion: nil)
    }
    
    //Chapter 15: Silver Challenge - Removing an image
    @IBAction func DeletePicture(_ sender: UIBarButtonItem) {
        let key = item.itemKey
        imageStore.deleteImage(forKey: key)
        imageView.image = imageStore.image(forKey: key)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]){
        
        //Chapter 15: Bronze Chllagen Editing an image
        //Get picked image from info dictionary
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // Store the image in the ImageStore for the item's key
        imageStore.setImage(image, forKey: item.itemKey)
        
        //Put that image on the screen in the image view
        imageView.image = image
        
        //Take image picker off the screen
        dismiss(animated: true, completion: nil)

    }
    
    var item: Item! {didSet {
        navigationItem.title = item.name}
    }
    var imageStore: ImageStore!
    
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
        
        //Get the item key
        let key = item.itemKey
        
        //If there is an associated image with the item display it on the image view
        let imageToDisplay = imageStore.image(forKey: key)
        imageView.image = imageToDisplay
        
    }
    
    //Chapter14
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //clear first responder
        view.endEditing(true)
        
        //"save" changse to item
        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberField.text
        
        if let valueText = valueField.text,
            let value = numberFormatter.number(from: valueText){
            item.valueInDollars = value.intValue
        }else{
            item.valueInDollars = 0
        }
    }
    
    //Dismissing by pressing the Return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //Chapter 14: Gold Challenge
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SetDate" {
            let chooseDateViewController = segue.destination as! ChooseDateViewController
            chooseDateViewController.item = item
        }
    }

}
