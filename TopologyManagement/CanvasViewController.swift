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
        self.performSegueWithIdentifier("CanvasMainMenuTableView", sender: self)

    }
    @IBAction func canvasNavigatorPanelBtn(sender: UIBarButtonItem) {
        //self.performSegueWithIdentifier("CanvasMainMenuTableView", sender: self)
        self.performSegueWithIdentifier("CanvasNavigationPanelTableView", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayer()
        self.sideMenuController()?.sideMenu?.delegate = self
    }
    
    func setUpLayer() {
        let screenSize = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width - 30
        let screenHeight = screenSize.height - 100
        
        
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
        
        var constY = NSLayoutConstraint(item: canvasView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: -10)
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