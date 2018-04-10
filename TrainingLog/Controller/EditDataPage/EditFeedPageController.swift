//
//  ViewController.swift
//  TrainingLog
//
//  Created on 1/22/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

public class EditFeedPageController: UITableViewController
{    
    // Initalize data members
    lazy var runList : [RunData] =
        {
            return loadRunningDataFromFile()
    }()
    
    /**
     This method loads the data from the data.txt file
     */
    private func loadRunningDataFromFile() -> [RunData]
    {
        // Initalize data members
        var items = [RunData]()
        let filePath = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent("data.csv")
        
        // Grab the contents of the file
        if let input = try? String(contentsOf: filePath)
        {
            // Seperate each workout
            let dataLines = input.components(separatedBy: "\n")
            for line in dataLines
            {
                // If the line count is greater that 2
                if(line.count > 2)
                {
                    // Seperate each element of the workout
                    let item = line.components(separatedBy: ", ")
                    items.append(RunData(name: item[0], distance: item[1], date: item[4]))
                }
            }
        }
        
        return items
    }
    
    //MARK: Table Veiw Code
    
    /**
     Method overrides its parent method and sets how many sections the table will have
     */
    override public func numberOfSections(in tableView: UITableView) -> Int
    {
        // Initalize data members
        var numOfSection: NSInteger = 0
        
        // If there is data in the list
        if (runList.count > 0)
        {
            // Set the number of sections to 1
            self.tableView.backgroundView = nil
            numOfSection = 1
        }
            // If there is no data in the list
        else
        {
            // Put a label on the view that says "No Data Available"
            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.size.width, height: self.tableView.bounds.size.height))
            noDataLabel.text = "No Data Avaliable"
            noDataLabel.textColor = UIColor(red: 22.0/255.0, green: 106.0/255.0, blue: 176.0/255.0, alpha: 1.0)
            noDataLabel.textAlignment = NSTextAlignment.center
            self.tableView.backgroundView = noDataLabel
        }
        
        return numOfSection
    }
    
    /**
     This method overrides its parent method and sets how many rows will be in the table
     */
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return runList.count
    }
    
    /**
     This method overrides its parent method and sets what will be in the cells
     */
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let currentCell = tableView.dequeueReusableCell(withIdentifier: "run", for: indexPath) as! FeedCell
        
        currentCell.runData = runList[indexPath.row]
        
        return currentCell
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
    }
}
