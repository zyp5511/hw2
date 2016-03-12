//
//  addaevent.swift
//  HW2Cs407
//
//  Created by ZhangYipeng on 16/3/11.
//  Copyright © 2016年 ZhangYipeng. All rights reserved.
//

import Foundation

import UIKit

class addaevent : UIViewController{
    
    var events = [AnyObject]()
    var day = Int()
    var month = Int()
    
    
    @IBOutlet var title_lable :UILabel!
    @IBOutlet var message :UILabel!
    
    @IBOutlet var title_TextField : UITextField!
    @IBOutlet var message_TextField : UITextField!
    
    var event_list:[String] = [String]();
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        self.title_lable.text = "title"
        self.message.text = "message"

        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : eventViewController = segue.destinationViewController as! eventViewController
          let date = "\(month)-\(day)"
          let event = Event(title: title_TextField.text!, date: date , message: message_TextField.text! )
            let encodedEvent = NSKeyedArchiver.archivedDataWithRootObject(event)
            events.append(encodedEvent)
            NSUserDefaults.standardUserDefaults().setObject(self.events, forKey: date)
            NSUserDefaults.standardUserDefaults().synchronize()
            DestViewController.day=self.day
            DestViewController.month=self.month
    }

}