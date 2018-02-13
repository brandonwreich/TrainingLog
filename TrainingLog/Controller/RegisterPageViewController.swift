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
    
    var illegalCharacters: [String] = ["<", ">", "(", ")", "[", "]", ";", ","]
    
    @IBAction func registerButtonClicked(_ sender: Any)
    {
        // Initalize data members
        let userEmail =  userEmailTextField.text!
        let userPassword = userPasswordTextField.text!
        let userConfirmPassword = userConfirmPasswordTextField.text!
        
        // If any of the fields are empty
        if (userEmail.isEmpty || userPassword.isEmpty || userConfirmPassword.isEmpty)
        {
            // Display the alert message
            displayMyAlertMessage(userMessage: "All fields are required to register")
            userPasswordTextField.text = ""
            userConfirmPasswordTextField.text = ""
            
            return;
        }
        
        if (!userEmail.contains("@"))
        {
            displayMyAlertMessage(userMessage: "Vaild email required")
            userPasswordTextField.text = ""
            userConfirmPasswordTextField.text = ""
            
            return;
        }
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
            displayMyAlertMessage(userMessage: "Valid email required")
            userPasswordTextField.text = ""
            userConfirmPasswordTextField.text = ""
            
            return;
        }
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
            displayMyAlertMessage(userMessage:"Valid email requird")
            userPasswordTextField.text = ""
            userConfirmPasswordTextField.text = ""
            
            return;
        }
        
        // If the userPassword does not match the userConfirmPassword
        if (userPassword != userConfirmPassword)
        {
            // Display the alert message
            displayMyAlertMessage(userMessage: "Passwords do not match")
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
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
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
