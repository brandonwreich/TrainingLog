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
        checkIfAnyFieldsAreEmpty()
    }
    
    /**
     Checks to see of any of the required fields are empty
     */
    public func checkIfAnyFieldsAreEmpty() -> Void
    {
        // Initalize data members
        let userEmail =  userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userConfirmPassword = userConfirmPasswordTextField.text
        
        // If any of the fields are empty
        if (userEmail!.isEmpty || userPassword!.isEmpty || userConfirmPassword!.isEmpty)
        {
            // Initalize an alert that says "All fields are required to register"
            let myAlert = UIAlertController(title: "Oops", message:"All fields are required to register", preferredStyle: UIAlertControllerStyle.alert)
            
            // Adding the okay button
            let okAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.default)
            
            // Adding the alert
            myAlert.addAction(okAction)
        }
    }
    
    public func checkIfPasswordsMatchEachOther()
    {
        // Initalize data members
        let userPassword = userPasswordTextField.text
        let userConfirmPassword = userConfirmPasswordTextField.text
        
        if (userPassword! != userConfirmPassword!)
        {
            
        }
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
