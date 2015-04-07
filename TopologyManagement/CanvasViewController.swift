//
//  CanvasViewController.swift
//  TopologyManagement
//
//  Created by Mark Anthony Elbambo on 3/30/15.
//  Copyright (c) 2015 Narra Systems Corp. All rights reserved.
//
import UIKit

class CanvasViewController: UIViewController, ENSideMenuDelegate {
    @IBOutlet var canvasMainView: UIView!
    
    @IBAction func canvasMainMenuBtn(sender: UIBarButtonItem) {
        hideSideMenuView()
        self.performSegueWithIdentifier("CanvasMainMenuTableView", sender: self)

    }
    @IBAction func canvasNavigatorPanelBtn(sender: UIBarButtonItem) {
        hideSideMenuView()
        self.performSegueWithIdentifier("CanvasNavigationPanelTableView", sender: self)
    }
    func domainBtnTrigger() {
        println("hey")
        self.performSegueWithIdentifier("SidebarDomainPicker", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayer()
        self.sideMenuController()?.sideMenu?.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        // 1
        var nav = self.navigationController?.navigationBar
        // 2
        //nav?.barStyle = UIBarStyle.Black
        //nav?.tintColor = UIColor.yellowColor()
        // 3
        let actionbuttons = ["commit","cancel","clear","loadactive"]
        for var ctr = 0; ctr < 3; ++ctr {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            imageView.contentMode = .ScaleAspectFit
            // 4
            let image = UIImage(named: actionbuttons[ctr])
            imageView.image = image
            // 5
            navigationItem.titleView = imageView
        }
        
        //for login auto redirect if not yet login
//        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
//        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
//        if (isLoggedIn != 1) {
//            self.performSegueWithIdentifier("goto_login", sender: self)
//        }
    }
    
    
    func setUpLayer() {
        let screenSize = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width - 30
        let screenHeight = screenSize.height - 150
        
        var canvasView = UIView()
        var l2: CALayer {
            return canvasView.layer
        }
        l2.borderWidth = 1.0
        l2.borderColor = UIColor(red: (57/255.0), green: (89/255.0), blue: (156/255.0), alpha: 1.0).CGColor

        canvasView.backgroundColor = UIColor(red: (255/255.0), green: (255/255.0), blue: (255/255.0), alpha: 1.0)
        view.addSubview(canvasView)
        
        //Don't forget this line
        canvasView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        var constX = NSLayoutConstraint(item: canvasView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        view.addConstraint(constX)
        
        var constY = NSLayoutConstraint(item: canvasView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 10)
        view.addConstraint(constY)
        
        var constW = NSLayoutConstraint(item: canvasView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: screenWidth)
        canvasView.addConstraint(constW)
        //view.addConstraint(constW) also works
        
        var constH = NSLayoutConstraint(item: canvasView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: screenHeight)
        canvasView.addConstraint(constH)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func toggleSideMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        println("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        println("sideMenuWillClose")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        println("sideMenuShouldOpenSideMenu")
        return true
    }
}