//
//  FeedCell.swift
//  TrainingLog
//
//  Created by Reich, Brandon on 2/23/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var runData : RunData!
    {
        didSet
        {
            updateCellView()
        }
    }
    
    private func updateCellView()
    {
        if (runData != nil)
        {
            nameLabel.text = runData.runName
            dateLabel.text = runData.runDate
        }
        else
        {
            nameLabel.text = "Name"
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
