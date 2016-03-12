//
//  mouth.swift
//  HW2Cs407
//
//  Created by ZhangYipeng on 16/3/11.
//  Copyright © 2016年 ZhangYipeng. All rights reserved.
//

import UIKit

class mouth: UITableViewController {
    
    var months: [String] = ["January","February","March","April","May","June","July","Auguest","September","October","November","December"]
    var days = 0
    var i = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return months.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = months[indexPath.row]
        
        return cell
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
      
        let i = indexPath.row
        if ( i == 3 || i == 6 || i==8 || i==11 ){
            days = 30
        }
        else if(i == 1){
            days = 28
        }
        else{
            days = 31
        }
        
        self.performSegueWithIdentifier("todays", sender: nil)
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "todays") {
            let vc: day = segue.destinationViewController as! day
            vc.day = days
            vc.month = i + 1
        }
        
    }

    
}
