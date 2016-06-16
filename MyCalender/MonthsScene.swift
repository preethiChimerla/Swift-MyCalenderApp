//
//  MonthsScene.swift
//  MyCalender
//
//  Created by preethi Reddy on 6/15/16.
//  Copyright (c) 2016 Chimerla. All rights reserved.
//

import Foundation
import UIKit
class MonthsScene : UITableViewController {
    
    var MonthsDataSet = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MonthsDataSet.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     let cell: AnyObject = tableView.dequeueReusableCellWithIdentifier("Basic")!
       cell.textLabel?!.text = MonthsDataSet[indexPath.row]
        return cell as! UITableViewCell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "MonthsScene"){
            let selectedRow = tableView.indexPathForSelectedRow()?.row
            if let dest = segue.destinationViewController as? DaysScene {
                dest.title = MonthsDataSet[selectedRow!]
                dest.monthNumber = selectedRow!+1
                
            }
        }
    }
}
