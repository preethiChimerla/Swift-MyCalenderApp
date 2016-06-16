//
//  DaysEvents.swift
//  MyCalender
//
//  Created by preethi Reddy on 6/15/16.
//  Copyright (c) 2016 Chimerla. All rights reserved.
//

import Foundation
import UIKit
class DaysEvents : UITableViewController{
    
    var EventsofDays:[String] = Array()
    var monthNumber = -1
    var dayNumber = -1
    
    override func viewDidLoad() {
        print(monthNumber)
        print(dayNumber)
    }
    
    @IBAction func addButtonPressed(sender: UIBarButtonItem){
        let newEvent = "TestEvent \(EventsofDays.count + 1)"
        EventsofDays.append(newEvent)
        tableView.reloadData()
    }
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    
        return true
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            EventsofDays.removeAtIndex(indexPath.row)
            let Sections =  NSIndexSet(index: 0)
            tableView.reloadSections(Sections, withRowAnimation: .Fade)
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventsofDays.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: AnyObject = tableView.dequeueReusableCellWithIdentifier("Basic")!
        cell.textLabel?!.text = EventsofDays[indexPath.row]
        return cell as! UITableViewCell
    }
    
    
    
    
}
