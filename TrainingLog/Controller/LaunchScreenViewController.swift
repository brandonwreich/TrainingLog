//
//  LaunchScreenViewController.swift
//  TrainingLog
//
//  Created by Reich, Brandon on 2/14/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

public class LaunchScreenViewController: UIViewController
{
    override public func viewDidAppear(_ animated: Bool)
    {
        sleep(4)
        self.performSegue(withIdentifier: "showApp", sender: true)
    }

    override public func viewDidLoad()
    {
        super.viewDidLoad()
     

        // Do any additional setup after loading the view.
    }
 
    override public func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
     
        
    }
}
