//
//  Event.swift
//  HW2Cs407
//
//  Created by ZhangYipeng on 16/3/11.
//  Copyright © 2016年 ZhangYipeng. All rights reserved.
//

import Foundation
import CoreData


class Event : NSObject {
    
    var date: String
    var title: String
    var message: String
    
    init(title t: String, date d : String, message m : String){
        title = t
        date = d
        message = m
    }
    
    init(withCoder coder:NSCoder){
        date = coder.decodeObjectForKey("date") as! String
        title = coder.decodeObjectForKey("title") as! String
        message = coder.decodeObjectForKey("message") as! String
    }
    
    func encodeWithCoder(coder:NSCoder){
        coder.encodeObject(date,forKey: "date")
        coder.encodeObject(title,forKey: "title")
        coder.encodeObject(title,forKey: "message")
        
    }
    
}
