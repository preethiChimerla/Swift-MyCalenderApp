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
    
    var EventsofDays:[AnyObject] = Array()
    var monthNumber = -1
    var dayNumber = -1
    
    override func viewDidLoad() {
        print(monthNumber)
        print(dayNumber)
    }
    
    @IBAction func addButtonPressed(sender: UIBarButtonItem){
        let newEvent = "TestEvent \(EventsofDays.count + 1)"
        
        let DefaultsKey = "\(monthNumber)-\(dayNumber)"
        let ce = CalenderEvent(WithTitle: newEvent, andDateString: DefaultsKey)
        let encodedce = NSKeyedArchiver.archivedDataWithRootObject(ce)
        EventsofDays.append(encodedce)
        NSUserDefaults.standardUserDefaults().setObject(EventsofDays, forKey: DefaultsKey)
        NSUserDefaults.standardUserDefaults().synchronize()
        //EventsofDays.append(newEvent)
        tableView.reloadData()
    }
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    
        return true
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            EventsofDays.removeAtIndex(indexPath.row)
            
            let DefaultsKey = "\(monthNumber)-\(dayNumber)"
            NSUserDefaults.standardUserDefaults().setObject(EventsofDays, forKey: DefaultsKey)
            NSUserDefaults.standardUserDefaults().synchronize()
            
            
            let Sections =  NSIndexSet(index: 0)
            tableView.reloadSections(Sections, withRowAnimation: .Fade)
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let DefaultsKey = "\(monthNumber)-\(dayNumber)"
        let ArrayOfEvents = NSUserDefaults.standardUserDefaults().arrayForKey(DefaultsKey)
        if let ArrayOfEvents = ArrayOfEvents {
            EventsofDays = ArrayOfEvents
        }
        return EventsofDays.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: AnyObject = tableView.dequeueReusableCellWithIdentifier("Basic")!
        if let eventObject = EventsofDays[indexPath.row] as? NSData{
            let ce = NSKeyedUnarchiver.unarchiveObjectWithData(eventObject) as! CalenderEvent
            cell.textLabel?!.text = ce.title
        }
        //cell.textLabel?!.text = EventsofDays[indexPath.row]
        return cell as! UITableViewCell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let selectedRow = (tableView.indexPathForSelectedRow()?.row)
        if let dest = segue.destinationViewController as? SingleDayEvent {
            if let eventObject  = EventsofDays[selectedRow!] as? NSData {
               let  ce = NSKeyedUnarchiver.unarchiveObjectWithData(eventObject) as! CalenderEvent
                dest.calenderEvent = ce
            }
        }
    }
    
    
    
}
