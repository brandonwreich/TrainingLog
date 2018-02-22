//
//  RegisterPageViewController.swift
//  TrainingLog
//
//  Created by Reich, Brandon on 2/12/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

public class RegisterPageViewController: UIViewController
{
    // Storyboard outlets
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField! 
    @IBOutlet weak var userConfirmPasswordTextField: UITextField!
    @IBOutlet weak var RegisterButton: UIButton!
    
    /**
     When the register button is clicked it first checks to see if all of the fields are filled. If
     some are empty you get an error message. Then it checks to see if you have a valid email, checking
     for a '@', and making sure you don't have any illegal characters such as '<' or '[' and also that
     you don't start with any illegal characters. If any of the creitera is NOT met then it will display an
     error message. It then checks to see if there is a valid password. A valid password contains 6-20
     characters and a number. Next it checks to see if the userPassword field and the userConfirmPassword field
     match, if not you get an error message. If all of those tests are passed the email and password are stored
     using UserDefaults and you get a confirmation message showing you have successfully registered.
     */
    @IBAction func registerButtonClicked(_ sender: Any)
    {
        // Initalize data members
        let userEmail =  userEmailTextField.text!
        let userPassword = userPasswordTextField.text!
        let userConfirmPassword = userConfirmPasswordTextField.text!
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
        
        // If any of the fields are empty
        if (userEmail.isEmpty || userPassword.isEmpty || userConfirmPassword.isEmpty)
        {
            // Display the alert message "All fields are required"
            displayMyAlertMessage(userMessage: "All fields are required to register")
            userPasswordTextField.text = ""
            userConfirmPasswordTextField.text = ""
            
            return;
        }
        
        // If the email contains a '@'
        if (!userEmail.contains("@"))
        {
            // Display alert message "Valid email required"
            displayMyAlertMessage(userMessage: "Vaild email required")
            
            // Set the password fields to empty
            userPasswordTextField.text = ""
            userConfirmPasswordTextField.text = ""
            
            return;
        }
            // If the email contains any illegal characters
        else if (userEmail.contains("<") ||
            userEmail.contains(">") ||
            userEmail.contains("(") ||
            userEmail.contains(")") ||
            userEmail.contains("[") ||
            userEmail.contains("]") ||
            userEmail.contains(";") ||
            userEmail.contains(",") ||
            userEmail.contains(" "))
        {
            // Display alert message "Valid email required"
            displayMyAlertMessage(userMessage: "Valid email required")
            
            // Set the password fields to empty
            userPasswordTextField.text = ""
            userConfirmPasswordTextField.text = ""
            
            return;
        }
            // If the email starts with a number, hyphen, period, or underscore
        else if (userEmail.hasPrefix("_") ||
            userEmail.hasPrefix(".") ||
            userEmail.hasPrefix("-") ||
            userEmail.hasPrefix("1") ||
            userEmail.hasPrefix("2") ||
            userEmail.hasPrefix("3") ||
            userEmail.hasPrefix("4") ||
            userEmail.hasPrefix("5") ||
            userEmail.hasPrefix("6") ||
            userEmail.hasPrefix("7") ||
            userEmail.hasPrefix("8") ||
            userEmail.hasPrefix("9") ||
            userEmail.hasPrefix("0"))
        {
            // Display alert message "Valid email required"
            displayMyAlertMessage(userMessage: "Valid email requird")
            
            // Set the password fields to empty
            userPasswordTextField.text = ""
            userConfirmPasswordTextField.text = ""
            
            return;
        }
        
        // Check to see if this email alread exsists
        if( userEmail == userEmailStored)
        {
            // Display alert message 'Email already exsits'
            displayMyAlertMessage(userMessage: "This email already exists")
            
            // Set the password fields to empty
            userPasswordTextField.text = ""
            userConfirmPasswordTextField.text = ""
            
            return;
        }
        
        // If the password is too short or too long
        if (userPassword.count < 5 || userPassword.count > 20)
        {
            // Display alter message 'Password is too short'
            displayMyAlertMessage(userMessage: "Passwords must be 6-20 characters long")
            
            // Set the password fields to empty
            userPasswordTextField.text = ""
            userConfirmPasswordTextField.text = ""
            
            return;
        }
            // If the password does NOT contain a number
        else if(!userPassword.contains("0") ||
            !userPassword.contains("1") ||
            !userPassword.contains("2") ||
            !userPassword.contains("3") ||
            !userPassword.contains("4") ||
            !userPassword.contains("5") ||
            !userPassword.contains("6") ||
            !userPassword.contains("7") ||
            !userPassword.contains("8") ||
            !userPassword.contains("9"))
        {
            // Display alert message 'Password must contain a number'
            displayMyAlertMessage(userMessage: "Passowords must contain at least one number")
            
            // Set the password fields to empty
            userPasswordTextField.text = ""
            userConfirmPasswordTextField.text = ""
        }
        
        // If the userPassword does not match the userConfirmPassword
        if (userPassword != userConfirmPassword)
        {
            // Display the alert message
            displayMyAlertMessage(userMessage: "Passwords do not match")
            
            // Set the password fields to empty
            userPasswordTextField.text = ""
            userConfirmPasswordTextField.text = ""
            
            return;
        }
        
        // Store data
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        UserDefaults.standard.set(userPassword, forKey: "userPassword")
        UserDefaults.standard.synchronize();
        
        // Display confirmation message
        let myAlert = UIAlertController(title: "Congradulations", message: "Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.default)
        {
            // Dismisses the view
            action in
            self.dismiss(animated: true, completion: nil)
        }
        
        // Add the action to the alert and present it
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
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
}
