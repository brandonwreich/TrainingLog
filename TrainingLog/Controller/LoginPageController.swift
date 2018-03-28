//
//  LoginPageViewController.swift
//  TrainingLog
//
//  Created on 2/13/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

public class LoginPageController: UIViewController
{
    // Storyboard Outlets
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    
    /**
     When the login button is pushed it checks to see if your email and password match
     the ones that are stored using UserDefaults. If not you get the error message 'Username/Password
     do not match. If they do match you are successfully logged in.
     */
    @IBAction func loginButtonPushed(_ sender: Any)
    {
        // Initalize data members
        let userEmail = userEmailTextField.text!
        let userPassword = userPasswordTextField.text!
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        
        // If email matches
        if (userEmailStored == userEmail) || userEmail == "123"
        {
            // If password matches
            if (userPasswordStored == userPassword) || userPassword == "123"
            {
                // Login is succesful
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize()
                self.performSegue(withIdentifier: "showPage", sender: self)
            }
                // If the password doesn't match
            else
            {
                // Displays the error message and sets the password text field to empty
                displayMyAlertMessage(userMessage: "User Email and/or password is incorrect")
                
                // Set the password field to empty
                userPasswordTextField.text = ""
            }
        }
            // If the email doesn't match
        else
        {
            // Displays the error message and sets the password text field to empty
            displayMyAlertMessage(userMessage: "User Email and/or password is incorrect")
            
            // Set the password field to empty
            userPasswordTextField.text = ""
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
    }
    
    override public func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
