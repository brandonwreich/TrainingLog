//
//  InputDataViewController.swift
//  TrainingLog
//
//  Created by Reich, Brandon on 2/21/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit
import Foundation

public class InputDataPageController: UIViewController
{
    // Storyboard outlets
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var paceTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var convertToMilesButton: UIButton!
    @IBOutlet weak var convertToKilometersButton: UIButton!
    
    // Initalize data members
    var dataArr = [Data]()
    var data: Data!
    
    /**
     This method takes the numbers inthe distanceTextField and turns it into a double and
     stores it in the variable distance. If it can't be turned into a double it will
     send an error message. It then takes distance and mulitplies it by the conversion
     number. The new number is then put into the distanceTextField.
     */
    @IBAction func convertToMiles(_ sender: Any)
    {
        // Initalize data members
        let conversion = 0.62137
        var convertedNumber = 0.00
        
        // If the distance can be turned into a double
        if let distance = Double(distanceTextField.text!)
        {
            // Calculate Km to Mi
            convertedNumber += (distance * conversion)
        }
        // If the distnace can't be turned into a double
        else
        {
            // Display alert message "Valid number required"
            displayMyAlertMessage(userMessage: "Valid number required")
        }
        
        // Set the textField to the new number
        distanceTextField.text = String(round(1000*convertedNumber)/1000)
    }
    
    /**
     This method takes the numbers inthe distanceTextField and turns it into a double and
     stores it in the variable distance. If it can't be turned into a double it will
     send an error message. It then takes distance and mulitplies it by the conversion
     number. The new number is then put into the distanceTextField.
     */
    @IBAction func convertToKilometers(_ sender: Any)
    {
        // Initalize data members
        let conversion = 0.62137
        var convertedNumber = 0.00
        
        // If the distance can be turned into a double
        if let distance = Double(distanceTextField.text!)
        {
            // Calculate Mi to Km
            convertedNumber += (distance / conversion)
        }
        // If the distance can't be turned into a double
        else
        {
            // Display alert message "Valid number required"
            displayMyAlertMessage(userMessage: "Valid number required")
        }
        
        // Set the textField to the new number
        distanceTextField.text = String(round(1000*convertedNumber)/1000)
    }
    
    public func calculatePace() -> Void
    {
        
    }
    
    @IBAction func saveData(_ sender: Any)
    {
        let distance = distanceTextField.text!
        let time = timeTextField.text!
        let pace = paceTextField.text!
       // let date = dateTextField.text!
        
        let fileName = "data"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        print("File Path: \(fileURL.path)")
        
        let writeString = "\(distance), \(time), \(pace)"
        do
        {
            try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        }
        catch let error as NSError
        {
            displayMyAlertMessage(userMessage: "Failed to write: \(error)")
        }
    }
    
    /**
     This method creates an alert to display every time one of the crietera is not met in registerButtonClicked.
     It takes a string as a parameter so you can type in the message you want.
     */
    public func displayMyAlertMessage(userMessage: String)
    {
        // Initalize data members
        let myAlert = UIAlertController(title: "Oops", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil)
        
        // Add the action to the alert and present it
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        
        data = Data()
        
    }
    
    override public func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
