//
//  LaunchScreenViewController.swift
//  TrainingLog
//
//  Created on 2/14/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

public class LaunchScreenController: UIViewController
{
    /**
     This method shows the launch screen for 4 seonds and then performs the segue to
     the login page.
     */
    override public func viewDidAppear(_ animated: Bool)
    {
        // Pause for 4 seconds
        sleep(4)
        
        // Go to the login page
        self.performSegue(withIdentifier: "showApp", sender: true)
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
