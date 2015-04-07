//
//  NewDeviceViewController.swift
//  TopologyManagement
//
//  Created by Benedict Solis on 4/1/15.
//  Copyright (c) 2015 Narra Systems Corp. All rights reserved.
//

import UIKit

class NewDeviceViewController : UITableViewController {

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        println("pasoks")
        // Set appropriate labels for the cells.
        if indexPath.row == 0 {
            cell.textLabel?.text = "AUTO DISCOVERY"
            cell.accessoryType = .DisclosureIndicator
        }else {
            cell.textLabel?.text = "MANUALLY ADDED"
            cell.accessoryType = .DisclosureIndicator
            
        }
        
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            self.performSegueWithIdentifier("AutoDiscover", sender: self)
        } else {
            self.performSegueWithIdentifier("Manual", sender: self)
        }
    }
    


}
