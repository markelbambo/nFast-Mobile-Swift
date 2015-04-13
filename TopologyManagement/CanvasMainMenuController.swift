//
//  CanvasMainMenuController.swift
//  TopologyManagement
//
//  Created by Mark Anthony Elbambo on 3/31/15.
//  Copyright (c) 2015 Narra Systems Corp. All rights reserved.
//
import UIKit

class CanvasMainMenuController: UITableViewController{
    let configSubMenus = ["Load","Save","Delete"]
    let toolsSubMenus = ["Auto Discover","Console","Running Configuration","Sanity Test","Sanity Results","Configuration","Software"]
    let viewsSubMenus = ["Custom View","Grid","Filter","Time Picker"]
    let mainMenuImgs = ["Load":"load","Save":"save","Delete":"delete","Auto Discover":"autodiscover","Console":"logs","Running Configuration":"config","Sanity Test":"topology_sanitytest","Sanity Results":"showactivity","Configuration":"config","Software":"software","Custom View":"customview","Grid":"grid","Filter":"filter","Time Picker":"timepicker"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return configSubMenus.count
        case 1:
            return toolsSubMenus.count
        case 2:
            return viewsSubMenus.count
        default:
            return 0
        }
    }
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mainMenuCell", forIndexPath: indexPath) as! UITableViewCell
        switch (indexPath.section) {
        case 0:
            cell.textLabel?.text = configSubMenus[indexPath.row]
            var imageName = UIImage(named: mainMenuImgs[configSubMenus[indexPath.row]]!)
            cell.imageView!.image = imageName
        case 1:
            cell.textLabel?.text = toolsSubMenus[indexPath.row]
            var imageName = UIImage(named: mainMenuImgs[toolsSubMenus[indexPath.row]]!)
            cell.imageView!.image = imageName
        case 2:
            cell.textLabel?.text = viewsSubMenus[indexPath.row]
            var imageName = UIImage(named: mainMenuImgs[viewsSubMenus[indexPath.row]]!)
            cell.imageView!.image = imageName
        default:
            cell.textLabel?.text = "Other"
        }
        return cell
    }
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        println("sectionssss==\(section)")
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("mainMenuHeaderCell") as! MainMenuHeaderCell
        headerCell.backgroundColor = UIColor(netHex:0x39599C)
        switch (section) {
        case 0:
            headerCell.headerLabel.text = "Config";
        case 1:
            headerCell.headerLabel.text = "Tools";
        case 2:
            headerCell.headerLabel.text = "View Options";
        default:
            headerCell.headerLabel.text = "Other";
        }
        
        return headerCell
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45.0
    }
    
//    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 40))
//        //footerView.backgroundColor = UIColor.blackColor()
//        
//        return footerView
//    }
//    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 20.0
//    }
    
}