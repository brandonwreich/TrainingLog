//
//  ViewController.swift
//  TrainingLog
//
//  Created by Reich, Brandon on 1/22/18.
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
                    items.append(RunData(name: item[0], date: item[1]))
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
        return 2
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return runList.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let currentCell = tableView.dequeueReusableCell(withIdentifier: "runIdentifier", for: indexPath) as! FeedCell
        
        currentCell.runData = runList[indexPath.row]
        
        return currentCell
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
    }
}



