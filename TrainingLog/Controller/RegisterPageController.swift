//
//  RegisterPageViewController.swift
//  TrainingLog
//
//  Created on 2/12/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

public class RegisterPageController: UIViewController
{
    // Storyboard outlets
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField! 
    @IBOutlet weak var userConfirmPasswordTextField: UITextField!
    @IBOutlet weak var RegisterButton: UIButton!
    
    /**
     When the register button is clicked it calls these helper methods to register
     the new user.
     */
    //startAbstraction
    //startAlgorithm
    @IBAction func registerButtonClicked(_ sender: Any)
    {
        checkIfFieldsAreEmpty()
        checkIfUsedValidEmail()
        checkIfEmailAlreadyExists()
        checkIfUsedValidPassword()
        checkIfPasswordEqualsConfirmPassword()
        storeData()
        displayConfirmationMessageAndDismissTheView()
    }
    
    /**
     This method checks to see if all of the fields are filled. If not it returns an error message.
     */
    public func checkIfFieldsAreEmpty()
    {
        // Initalize data members
        let userEmail =  userEmailTextField.text!
        let userPassword = userPasswordTextField.text!
        let userConfirmPassword = userConfirmPasswordTextField.text!
        
        // If any of the fields are empty
        if (userEmail.isEmpty || userPassword.isEmpty || userConfirmPassword.isEmpty)
        {
            // Display the alert message "All fields are required"
            displayMyAlertMessage(userMessage: "All fields are required to register")
            userPasswordTextField.text = ""
            userConfirmPasswordTextField.text = ""
            
            return;
        }
    }
    
    //endAbstraction
    //endAlgorithm
    
    /**
     This method checks to see if the user inputed a valid email. It checks for a '@' and makes sure
     that it doesn't contain illegal characters such as '<' or '['. It also makes sure that the
     the email doesn't start with any numbers, spaces, or periods. Returns an error message if
     there are any problems
     */
    public func checkIfUsedValidEmail()
    {
        // Initalize data members
        let userEmail =  userEmailTextField.text!
        
        // If the email contains a '@'
        if (userEmail.index(of: "@") == nil)
        {
            // Display alert message "Valid email required"
            displayMyAlertMessage(userMessage: "Vaild email required")
            
            // Set the password fields to empty
            userPasswordTextField.text = ""
            userConfirmPasswordTextField.text = ""
            
            return;
        }
            // If the email contains any illegal characters
            //startAlgorithm
        else if (userEmail.index(of: "<") != nil ||
            userEmail.index(of: ">") != nil ||
            userEmail.index(of: "(") != nil ||
            userEmail.index(of: ")") != nil ||
            userEmail.index(of: "[") != nil ||
            userEmail.index(of: "]") != nil ||
            userEmail.index(of: ";") != nil ||
            userEmail.index(of: ",") != nil ||
            userEmail.index(of: " ") != nil)
        {
            // Display alert message "Valid email required"
            displayMyAlertMessage(userMessage: "Valid email required")
            
            // Set the password fields to empty
            userPasswordTextField.text = ""
            userConfirmPasswordTextField.text = ""
            
            return;
        }
            //endAlgorithm
            
            //startAlgorithm
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
        //endAlgorithm
    }
    
    /**
     This method checks to see if the email already exsits in the system. Returns an error message
     if there are any problems.
     */
    public func checkIfEmailAlreadyExists()
    {
        // Initalize data members
        let userEmail =  userEmailTextField.text!
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
        
        // Check to see if this email alread exsists
        if(userEmailStored == userEmail)
        {
            // Display alert message 'Email already exsits'
            displayMyAlertMessage(userMessage: "This email already exists")
            
            // Set the password fields to empty
            userPasswordTextField.text = ""
            userConfirmPasswordTextField.text = ""
            
            return;
        }
    }
    
    /**
     This method checks to see if the user inputs a valid password. If the password is less than 5
     or more than 20 characters long it returns an error message. You also need one number to have
     a valid password.
     */
    public func checkIfUsedValidPassword()
    {
        // Initalize data members
        let userPassword = userPasswordTextField.text!
        
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
            //startAlgorithm
        else if(userPassword.index(of: "0") == nil &&
            userPassword.index(of: "1") == nil &&
            userPassword.index(of: "2") == nil &&
            userPassword.index(of: "3") == nil &&
            userPassword.index(of: "4") == nil &&
            userPassword.index(of: "5") == nil &&
            userPassword.index(of: "6") == nil &&
            userPassword.index(of: "7") == nil &&
            userPassword.index(of: "8") == nil &&
            userPassword.index(of: "9") == nil)
        {
            // Display alert message 'Password must contain a number'
            displayMyAlertMessage(userMessage: "Passwords must contain at least one number")
            
            // Set the password fields to empty
            userPasswordTextField.text = ""
            userConfirmPasswordTextField.text = ""
            
            return;
        }
        //endAlgorithm
    }
    
    /**
     This method checks to see if the password box equals the confirm password box. Returns an
     error message with any problems
     */
    public func checkIfPasswordEqualsConfirmPassword()
    {
        // Initalize data members
        let userPassword = userPasswordTextField.text!
        let userConfirmPassword = userConfirmPasswordTextField.text!
        
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
    }
    
    /**
     This method stores the data in NSUserDefaults
     */
    public func storeData()
    {
        // Initalize data members
        let userEmail =  userEmailTextField.text!
        let userPassword = userPasswordTextField.text!
        
        // Store data
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        UserDefaults.standard.set(userPassword, forKey: "userPassword")
        UserDefaults.standard.synchronize();
    }
    
    /**
     This method shows the confirmation message and dismissese the view.
     */
    public func displayConfirmationMessageAndDismissTheView()
    {
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
    
    override public func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
