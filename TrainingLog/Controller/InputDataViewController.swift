//
//  InputDataViewController.swift
//  TrainingLog
//
//  Created by Reich, Brandon on 2/21/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

public class InputDataViewController: UIViewController
{
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var paceTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var convertToMilesButton: UIButton!
    @IBOutlet weak var convertToKilometersButton: UIButton!
    
    @IBAction func convertToMiles(_ sender: Any)
    {
        let conversion = 0.62137
        var convertedNumber = 0.00
        if let distance = Double(distanceTextField.text!)
        {
            convertedNumber += (distance * conversion)
        }
        else
        {
            displayMyAlertMessage(userMessage: "Valid number required")
        }
        
        distanceTextField.text = String(round(1000*convertedNumber)/1000)
    }
    
    @IBAction func convertToKilometers(_ sender: Any)
    {
        let conversion = 0.62137
        var convertedNumber = 0.00
        if let distance = Double(distanceTextField.text!)
        {
            convertedNumber += (distance / conversion)
        }
        else
        {
            displayMyAlertMessage(userMessage: "Valid number required")
        }
        
        distanceTextField.text = String(round(1000*convertedNumber)/1000)
    }
    
    @IBAction func saveData(_ sender: Any)
    {
        let distance = distanceTextField.text!
        let time = timeTextField.text!
        let pace = paceTextField.text!
        let description = descriptionTextField.text!
    }
    
    public func displayMyAlertMessage(userMessage: String)
    {
        let myAlert = UIAlertController(title: "Oops", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override public func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
