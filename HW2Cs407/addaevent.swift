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
        // Do any additional setup after loading the view, typically from a nib.
        self.title_lable.text = "title"
        self.message.text = "message"

        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : eventViewController = segue.destinationViewController as! eventViewController
          let date = "\(month)-\(day)"
          let event = Event(title: title_TextField.text!, date: date , message: message_TextField.text! )
            events.append(event);
            DestViewController.events=self.events
        DestViewController.day=day
        DestViewController.month=month
    }



}