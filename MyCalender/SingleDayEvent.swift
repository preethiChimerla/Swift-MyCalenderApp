//
//  SingleDayEvent.swift
//  MyCalender
//
//  Created by preethi Reddy on 6/15/16.
//  Copyright (c) 2016 Chimerla. All rights reserved.
//

import Foundation
import UIKit
class SingleDayEvent : UIViewController {
    
    var calenderEvent : CalenderEvent?
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var DateLabel : UILabel!
    
    override func viewDidLoad() {
       titleLabel.text = calenderEvent?.title
        DateLabel.text = calenderEvent?.dateString
    
    }
   
}