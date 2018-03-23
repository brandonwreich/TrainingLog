//
//  FeedCell.swift
//  TrainingLog
//
//  Created on 2/23/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell
{
    // Storyboard outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var runData : RunData!
    {
        didSet
        {
            updateCellView()
        }
    }
    
    /**
     This method updates the cells. It takes the name and date from
     runData and puts it into the appropiate label. If there is no
     data the labels read "Name" and "Date"
     */
    private func updateCellView()
    {
        // If there is data in runData
        if (runData != nil)
        {
            // Set the name and date labels to the name and date
            nameLabel.text = runData.runName
            distanceLabel.text = runData.runDistance + " miles"
            dateLabel.text = runData.runDate
        }
        // If there is not data in runData
        else
        {
            // Set the nae and date labels to "Name" and "Date"
            nameLabel.text = "Name"
            distanceLabel.text = "Distance"
            dateLabel.text = "Date"
            
        }
    }
    
    override public func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    override public func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
