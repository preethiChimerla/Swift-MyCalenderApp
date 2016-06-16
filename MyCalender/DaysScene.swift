//
//  DaysScene.swift
//  MyCalender
//
//  Created by preethi Reddy on 6/15/16.
//  Copyright (c) 2016 Chimerla. All rights reserved.
//

import Foundation
import UIKit
class DaysScene : UITableViewController{
    var monthNumber = -1
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 31
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: AnyObject = tableView.dequeueReusableCellWithIdentifier("Basic")!
        cell.textLabel?!.text = "\(indexPath.row + 1)"
        return cell as! UITableViewCell 
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "DaysEventScene"){
            let selectedRow = tableView.indexPathForSelectedRow()?.row
            
            if let dest = segue.destinationViewController as? DaysEvents {
                dest.title = "\(selectedRow! + 1)"
                dest.monthNumber = monthNumber + 1
                dest.dayNumber = selectedRow! + 1
                
            }
        }
    }
}
