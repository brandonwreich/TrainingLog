//
//  InputDataViewController.swift
//  TrainingLog
//
//  Created by Reich, Brandon on 2/21/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

class InputDataViewController: UIViewController
{

    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var paceTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    
    let distanceTextField = distance
    let timeTextField = time
    let paceTextField = pace
    let descriptionTextField = description
    
    
    
    
    
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
