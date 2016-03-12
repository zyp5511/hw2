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
    
    var day = Int()
    var month = Int()
    var mactcharray = [AnyObject]()
    
    
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
        print("Returned from detail screen~!!!!!")
        
        let Date = "\(month)-\(day)"
        let defaults = NSUserDefaults.standardUserDefaults()
        let events = defaults.arrayForKey(Date)
        for var i = 0; i < events!.count; i++ {
            let event = NSKeyedUnarchiver.unarchiveObjectWithData(events![i] as! NSData) as! Event
            if (event.date == Date){
                mactcharray.append(event)
            }
        }
           self.tableView.reloadData()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        let Date = "\(month)-\(day)"
        let defaults = NSUserDefaults.standardUserDefaults()
        var events = defaults.arrayForKey(Date)
        if (events != nil){
        for var i = 0; i < events!.count; i++ {
            let event = NSKeyedUnarchiver.unarchiveObjectWithData(events![i] as! NSData) as! Event
            if (event.date == Date){
                mactcharray.append(event)
            }
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
    
            cell.textLabel?.text = mactcharray[indexPath.row].title
    
        return cell
    }

    
    
   override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        var events = [AnyObject]()
        let Date = "\(month)-\(day)"
        if editingStyle == .Delete {
           mactcharray.removeAtIndex(indexPath.row)
        for var i = 0; i < mactcharray.count; i++ {
            let encodedEvent = NSKeyedArchiver.archivedDataWithRootObject(mactcharray[i])
            events.append(encodedEvent)
            }
            NSUserDefaults.standardUserDefaults().setObject(events, forKey: Date)
           self.tableView.reloadData()
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : addaevent = segue.destinationViewController as! addaevent
        DestViewController.day=self.day
        DestViewController.month=self.month
    }
    
}
