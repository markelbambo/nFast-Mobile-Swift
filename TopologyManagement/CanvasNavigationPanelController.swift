//
//  CanvasNavigationPanelController.swift
//  TopologyManagement
//
//  Created by Mark Anthony Elbambo on 3/31/15.
//  Copyright (c) 2015 Narra Systems Corp. All rights reserved.
//
import UIKit

class CanvasNavigationPanelController: UITableViewController{
    let navigationImages = ["topology-console","topology_sanitytest","canvasmapping","zoomdefault","configname","historyIcon"]
    let navigationTitle = ["Remote Console","Sanity Test","Canvas Navigator","Zoom","Config Name","History"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return navigationImages.count
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("navigationMenuCell") as! UITableViewCell
        
        cell.textLabel!.text = navigationTitle[indexPath.row]
        
        var imageName = UIImage(named: navigationImages[indexPath.row])
        cell.imageView!.image = imageName
        
        return cell
    }
    
    override func tableView(tableView: (UITableView!), didSelectRowAtIndexPath indexPath: (NSIndexPath!)) {
        let alert = UIAlertController(title: "Item selected", message: "You selected item \(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default,
            handler: {
                (alert: UIAlertAction!) in println("An alert of type \(alert.style.hashValue) was tapped!")
                self.tableView?.deselectRowAtIndexPath(indexPath, animated: true)
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

}