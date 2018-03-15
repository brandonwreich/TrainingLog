//
//  RunData.swift
//  TrainingLog
//
//  Created on 3/7/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import Foundation

class RunData
{
    // Initalize data members
    let runName : String
    let runDistance : String
    let runDate : String
    
    init(name: String, distance: String, date: String)
    {
        runName = name
        runDistance = distance
        runDate = date
    }
}
