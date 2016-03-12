//
//  event.swift
//  HW2Cs407
//
//  Created by ZhangYipeng on 16/3/11.
//  Copyright © 2016年 ZhangYipeng. All rights reserved.
//

import UIKit
import CoreData

class eventViewController: UITableViewController {
    
    var events = [AnyObject]()
    var day = Int()
    var month = Int()
    var  mactcharray = [AnyObject]()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Date = "\(month)-\(day)"
        
        for var i = 0; i < events.count; i++ {
            if (events[i].date == Date){
                mactcharray.append(events[i])
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
 
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return mactcharray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath)
        for var i = 0; i < mactcharray.count; i++ {
            cell.textLabel?.text = mactcharray[i].title
        }
        
        return cell
    }

    
    
   override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
           
            var a = 0;
            for var index = 0; index < events.count ; index++ {
                if (mactcharray[indexPath.row].title == events[index].title && mactcharray[indexPath.row].date == events[index].date ) {
                    a = index
                }
            }
            
           events.removeAtIndex(a)
           mactcharray.removeAtIndex(indexPath.row)
           self.tableView.reloadData()
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : addaevent = segue.destinationViewController as! addaevent
        DestViewController.day=self.day
        DestViewController.month=self.month
        DestViewController.events=self.events
    }
    
}
