//
//  CanvasSideBarTableController.swift
//  TopologyManagement
//
//  Created by Mark Anthony Elbambo on 3/30/15.
//  Copyright (c) 2015 Narra Systems Corp. All rights reserved.
//
import UIKit

class CanvasSideBarTableViewController: UITableViewController{
    var selectedMenuItem : Int = 0
    let sidebarHeader = ["Domain","TestTool","Device","Server","Topology","Connectivity"]
    let sidebarHeaderImages = ["Domain","Testtool","Device","Server","topologylist","Connectivity"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize apperance of table view
        tableView.contentInset = UIEdgeInsetsMake(64.0, 0, 0, 0) //
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.clearColor()
        //tableView.scrollsToTop = true
        
        // Preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        tableView.selectRowAtIndexPath(NSIndexPath(forRow: selectedMenuItem, inSection: 0), animated: false, scrollPosition: .Middle)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return sidebarHeader.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("CELL") as? UITableViewCell
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CELL")
            cell!.backgroundColor = UIColor.clearColor()

//            if(indexPath.row == 0){
//                
//                let button : UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
//                button.frame = CGRectMake(40, 60, 100, 24)
//                
//                let cellHeight: CGFloat = 44.0
//                button.center = CGPoint(x: view.bounds.width / 2.0, y: cellHeight / 2.0)
//                
//                //button.backgroundColor = UIColor.redColor()
//                //button.addTarget(self, action: "buttonClicked:", forControlEvents:
//                //    UIControlEvents.TouchUpInside)
//                button.setTitle("Domain", forState: UIControlState.Normal)
//                cell!.addSubview(button)
//            }else{
                cell!.textLabel?.textColor = UIColor.darkGrayColor()
                let selectedBackgroundView = UIView(frame: CGRectMake(0, 0, cell!.frame.size.width, cell!.frame.size.height))
                selectedBackgroundView.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.2)
                cell!.selectedBackgroundView = selectedBackgroundView
                
                cell!.textLabel?.text = sidebarHeader[indexPath.row]
                var imageName = UIImage(named: sidebarHeaderImages[indexPath.row])
                cell!.imageView!.image = imageName
            //}
        }
        return cell!
    }
//    func buttonClicked(sender: UIButton!) {
//        CanvasViewController().domainBtnTrigger()
//    } 
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("CELLhader") as? UITableViewCell
        headerCell!.backgroundColor = UIColor(netHex:0x39599C)
        println("sections==\(section)")
        switch (section) {
        case 0:
            headerCell!.textLabel?.text = "Config";
        case 1:
            headerCell!.textLabel?.text = "Tools";
        case 2:
            headerCell!.textLabel?.text = "View Options";
        default:
            headerCell!.textLabel?.text = "Other";
        }
        return headerCell
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println("did select row: \(indexPath.row)")
        println("selectedMEnuItem\(selectedMenuItem)")
        println("header==\(sidebarHeader[indexPath.row])")
        if (indexPath.row == selectedMenuItem) {
            return
        }
        selectedMenuItem = indexPath.row
        
        //Present new view controller
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        var destViewController : UIViewController
        switch (indexPath.row) {
        case 0:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("SidebarDomainPicker") as UIViewController
            break
        case 1:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("SidebarDomainPicker")as UIViewController
            break
        case 2:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("SidebarDomainPicker")as UIViewController
            break
        default:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("SidebarDomainPicker") as UIViewController
            break
        }
        sideMenuController()?.setContentViewController(destViewController)
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
