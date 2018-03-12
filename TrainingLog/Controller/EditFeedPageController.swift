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
    lazy var runList : [RunData] =
        {
            return loadRunningDataFromFile()
    }()
    
    private func loadRunningDataFromFile() -> [RunData]
    {
        var items = [RunData]()
        
        if let filePath = Bundle.main.url(forResource: "data", withExtension: "txt")
        {
            do
            {
                let input = try String(contentsOf: filePath)
                let dataLines = input.components(separatedBy: "\n")
                for line in dataLines
                {
                    let item = line.components(separatedBy: ",")
                    items.append(RunData(name: item[0], date: item[4]))
                }
            }
            catch let error as NSError
            {
                print("Error with loading file. \(error)")
            }
        }
        
        return items
    }
    
    //MARK: Table Veiw Code
    
    override public func numberOfSections(in tableView: UITableView) -> Int
    {
        var numOfSection: NSInteger = 0
        
        if (runList.count > 0)
        {
            self.tableView.backgroundView = nil
            numOfSection = 1
        }
        else
        {    
            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.size.width, height: self.tableView.bounds.size.height))
            noDataLabel.text = "No Data Available"
            noDataLabel.textColor = UIColor(red: 22.0/255.0, green: 106.0/255.0, blue: 176.0/255.0, alpha: 1.0)
            noDataLabel.textAlignment = NSTextAlignment.center
            self.tableView.backgroundView = noDataLabel
        }
        
        return numOfSection
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return runList.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let currentCell = tableView.dequeueReusableCell(withIdentifier: "run", for: indexPath) as! FeedCell
        
        currentCell.runData = runList[indexPath.row]
        
        return currentCell
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}



