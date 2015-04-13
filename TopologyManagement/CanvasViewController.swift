//
//  CanvasViewController.swift
//  TopologyManagement
//
//  Created by Mark Anthony Elbambo on 3/30/15.
//  Copyright (c) 2015 Narra Systems Corp. All rights reserved.
//
import UIKit

class CanvasViewController: UIViewController, ENSideMenuDelegate, UICollisionBehaviorDelegate {
    @IBOutlet var canvasMainView: UIView!
    @IBOutlet var canvasActionButtonsOutlet: UISegmentedControl!
    var canvasView = UIView()
    
    
    var animator: UIDynamicAnimator!
    var collision: UICollisionBehavior!
    var square: UIView!
    var snap: UISnapBehavior!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayer()
        self.sideMenuController()?.sideMenu?.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        createDevice()
        createDevice2()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func canvasMainMenuBtn(sender: UIBarButtonItem) {
        hideSideMenuView()
        self.performSegueWithIdentifier("CanvasMainMenuTableView", sender: self)
    }
    @IBAction func canvasNavigatorPanelBtn(sender: UIBarButtonItem) {
        hideSideMenuView()
        self.performSegueWithIdentifier("CanvasNavigationPanelTableView", sender: self)
    }
    func domainBtnTrigger() {
        self.performSegueWithIdentifier("SidebarDomainPicker", sender: self)
    }
    @IBAction func canvasActionButtons(sender: UISegmentedControl) {
        switch canvasActionButtonsOutlet.selectedSegmentIndex {
        case 0:
            println("commit")
        case 1:
            println("clear")
        case 2:
            println("cancel")
        case 3:
            println("load active")
        default:
            println("dasd")
            break;
        }
        canvasActionButtonsOutlet.selectedSegmentIndex = -1
    }

    
    
    func setUpLayer() {
        let screenSize = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width - 30
        let screenHeight = screenSize.height - 150
        
        
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
    
    
    func createDevice2(){
        square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.grayColor()
        canvasView.addSubview(square)
     
        animator = UIDynamicAnimator(referenceView: canvasView)
        
        collision = UICollisionBehavior(items: [square])
        collision.collisionDelegate = self
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        let itemBehaviour = UIDynamicItemBehavior(items: [square])
        //itemBehaviour.elasticity = 1
        animator.addBehavior(itemBehaviour)
    }
    func collisionBehavior(behavior: UICollisionBehavior!, beganContactForItem item: UIDynamicItem!, withBoundaryIdentifier identifier: NSCopying!, atPoint p: CGPoint) {
        println("Boundary contact occurred - \(identifier)")
        
        let collidingView = item as! UIView
        collidingView.backgroundColor = UIColor.yellowColor()
        UIView.animateWithDuration(0.3) {
            collidingView.backgroundColor = UIColor.grayColor()
        }
    }
    override func touchesEnded(touches:  Set<NSObject>, withEvent event: UIEvent) {
        if (snap != nil) {
            animator.removeBehavior(snap)
        }
        if let touch = touches.first as? UITouch {
            snap = UISnapBehavior(item: square, snapToPoint: touch.locationInView(view))
            animator.addBehavior(snap)
        }
        
    }

    
    
    
    func createDevice(){
        let halfSizeOfView = 25.0
        let canvasWidth = (CGRectGetWidth(canvasView.bounds) - 30)
        let canvasHeigth = (CGRectGetHeight(canvasView.bounds) - 30)
        let insetSize = CGRectInset(canvasView.bounds, CGFloat(Int(2 * halfSizeOfView)), CGFloat(Int(2 * halfSizeOfView))).size
        
        var pointX = CGFloat(UInt(arc4random() % UInt32(UInt(insetSize.width))))
        var pointY = CGFloat(UInt(arc4random() % UInt32(UInt(insetSize.height))))
        
        var newView = CanvasNodeCreator(frame: CGRectMake(pointX, pointY, 50, 50), canvasWidth: canvasWidth, canvasHeigth: canvasHeigth)
        canvasView.addSubview(newView)
    }
}