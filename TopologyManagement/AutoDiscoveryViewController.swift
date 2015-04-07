//
//  AutoDiscoveryViewController.swift
//  TopologyManagement
//
//  Created by Benedict Solis on 4/4/15.
//  Copyright (c) 2015 Narra Systems Corp. All rights reserved.
//

import UIKit

class AutoDiscoveryViewController: UITableViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        println("pasoks")
        // Set appropriate labels for the cells.
        if indexPath.row == 0 {
            cell.textLabel?.text = "Device Information"
            cell.accessoryType = .DisclosureIndicator
        }else if indexPath.row == 1 {
            cell.textLabel?.text = "Partner Information"
            cell.accessoryType = .DisclosureIndicator
        }else {
            cell.textLabel?.text = "Optional Details"
            cell.accessoryType = .DisclosureIndicator
            
        }
        
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            self.performSegueWithIdentifier("DeviceInfo2", sender: self)
        } else if indexPath.row == 1 {
            self.performSegueWithIdentifier("PartnerInfo", sender: self)
        } else {
            self.performSegueWithIdentifier("OptionalDet", sender: self)
        }
    }

}
