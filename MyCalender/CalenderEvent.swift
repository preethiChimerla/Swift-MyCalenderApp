//
//  CalenderEvent.swift
//  MyCalender
//
//  Created by preethi Reddy on 6/16/16.
//  Copyright (c) 2016 Chimerla. All rights reserved.
//

import Foundation

class CalenderEvent : NSObject {
    
    var title : String
    var dateString : String
    
    init(WithTitle t : String, andDateString ds : String){
        title = t
        dateString = ds
        
    }
    init(WithCoder coder : NSCoder){
        dateString = coder.decodeObjectForKey("dateString") as! String
        title = coder.decodeObjectForKey("title") as! String
    }
    
    func encodeWithCoder(coder : NSCoder){
        coder.encodeObject(dateString, forKey: "dateString")
        coder.encodeObject(title, forKey: "title")
    }
    
}