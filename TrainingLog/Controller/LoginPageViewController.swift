//
//  LoginPageViewController.swift
//  TrainingLog
//
//  Created by Reich, Brandon on 2/13/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController
{
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
        let userEmail = userEmailTextField.text!
        let userPassword = userPasswordTextField.text!
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        
        // If email matches
        if (userEmailStored == userEmail)
        {
            // If password matches
            if (userPasswordStored == userPassword)
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
                displayMyAlertMessage(userMessage: "Email and/or password is incorrect")
                
                // Set the password field to empty
                userPasswordTextField.text = ""
            }
        }
        // If the email doesn't match
        else
        {
            // Displays the error message and sets the password text field to empty
            displayMyAlertMessage(userMessage: "Email and/or password is incorrect")
            
            // Set the password field to empty
            userPasswordTextField.text = ""
        }
    }
    
    public func displayMyAlertMessage(userMessage: String)
    {
        let myAlert = UIAlertController(title: "Oops", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
