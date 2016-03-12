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
    
    
    
   /*
    @IBAction func addButtonPressed(sender : UIBarButtonItem){
        let defaultDate = "\(month)-\(day)"
        
        let alert = UIAlertController(title: "Add Event", message: "\(month)-\(day)", preferredStyle: .Alert)
        
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.text = ""
        })
        
        let MyCancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) {
            // Handle Cancel Logic here - when user press cancel button, like
            action in self.dismissViewControllerAnimated(true, completion: nil)
        }
        alert.addAction(MyCancelAction)
        
        
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            let textField = alert.textFields![0] as UITextField
            let event = Event(withTitle: textField.text!, andDate: defaultDate)
            let encodedEvent = NSKeyedArchiver.archivedDataWithRootObject(event)
            self.events.append(encodedEvent)
            NSUserDefaults.standardUserDefaults().setObject(self.events, forKey: defaultDate)
            NSUserDefaults.standardUserDefaults().synchronize()
            self.tableView.reloadData()
        }))
        self.presentViewController(alert, animated: true, completion: nil)
        
        
    }
*/
    
    
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
        print("Returned from detail screen~!!!!!")
    }

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
        let defaultsDate = "\(month)-\(day)"
        let eventsArray = NSUserDefaults.standardUserDefaults().arrayForKey(defaultsDate)
        if let eventsArray = eventsArray{
            events = eventsArray
        }
        return events.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath)
        if let eventObj = events[indexPath.row] as? NSData {
            let event = NSKeyedUnarchiver.unarchiveObjectWithData(eventObj) as! Event
            cell.textLabel?.text = event.title
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        //let storyboard = UIStoryboard(name: "storyboard", bundle: nil);
        //let days = storyboard.instantiateViewControllerWithIdentifier("DaysTableViewController") as! UITableViewController
        //let destinationVC:DaysTableViewController = DaysTableViewController()
        
        self.performSegueWithIdentifier("addaevent", sender: nil)
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            events.removeAtIndex(indexPath.row)
            
            let defaultsDate = "\(month)-\(day)"
            NSUserDefaults.standardUserDefaults().setObject(events, forKey: defaultsDate)
            NSUserDefaults.standardUserDefaults().synchronize()
            let section = NSIndexSet(index:0)
            tableView.reloadSections(section,withRowAnimation: .Fade)
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : addaevent = segue.destinationViewController as! addaevent
  
        DestViewController.events=self.events
    }
    
}
