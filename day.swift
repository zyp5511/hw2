//
//  day.swift
//  HW2Cs407
//
//  Created by ZhangYipeng on 16/3/11.
//  Copyright © 2016年 ZhangYipeng. All rights reserved.
//

import UIKit

class day : UITableViewController {
    
    var month = Int()
    var day = Int()
    var numDays = [String]()
    var row = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return day
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("daysCell", forIndexPath: indexPath)
        for var i = 0; i < day; ++i {
            numDays.append(String(i+1))
        }
        cell.textLabel?.text = numDays[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
             row = indexPath.row
        self.performSegueWithIdentifier("Events", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "Events") {
            let vc: eventViewController = segue.destinationViewController as! eventViewController
            vc.day = row + 1
            vc.month = month
        }
        
    }
    
}
