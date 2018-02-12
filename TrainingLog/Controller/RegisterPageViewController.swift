//
//  RegisterPageViewController.swift
//  TrainingLog
//
//  Created by Reich, Brandon on 2/12/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController
{
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userConfirmPasswordTextField: UITextField!
    @IBOutlet weak var RegisterButton: UIButton!
    
    @IBAction func registerButtonClicked(_ sender: Any)
    {
        // Initalize data members
        let userEmail =  userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userConfirmPassword = userConfirmPasswordTextField.text
        
        // If any of the fields are empty
        if (userEmail!.isEmpty || userPassword!.isEmpty || userConfirmPassword!.isEmpty)
        {
            // Display the alert message
            displayMyAlertMessage(userMessage: "All fields are required to register")
            
            return;
        }
        
        // If the userPassword does not match the userConfirmPassword
        if (userPassword! != userConfirmPassword!)
        {
            // Display the alert message
            displayMyAlertMessage(userMessage: "Passwords do not match")
            
            return;
        }
        
        //Store data
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
}
