//
//  CanvasNodeCreator.swift
//  TopologyManagement
//
//  Created by Mark Anthony Elbambo on 4/10/15.
//  Copyright (c) 2015 Narra Systems Corp. All rights reserved.
//

import UIKit

class CanvasNodeCreator: UIView {
    
    
    var lastLocation:CGPoint = CGPointMake(0, 0)
    let canvasW : CGFloat
    let canvasH : CGFloat
    init(frame: CGRect, canvasWidth: CGFloat, canvasHeigth: CGFloat) {
        self.canvasW = canvasWidth
        self.canvasH = canvasHeigth
        super.init(frame: frame)
        //canvasWidth: canvasWidth, canvasHeigth: canvasHeigth
        // Initialization code
        var panRecognizer = UIPanGestureRecognizer(target:self, action:"detectPan:")
        self.gestureRecognizers = [panRecognizer]
        
        //randomize view color
        let blueValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let greenValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let redValue = CGFloat(Int(arc4random() % 255)) / 255.0
        
        self.backgroundColor = UIColor(red:redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func detectPan(recognizer:UIPanGestureRecognizer) {
        var translation  = recognizer.translationInView(self.superview!)
        self.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch = touches.first as? UITouch {
            self.superview?.bringSubviewToFront(self)
        }
        super.touchesBegan(touches , withEvent:event)
        lastLocation = self.center
//        let xSelfLoc = self.center.x
//        let ySelfLoc = self.center.y
//        if(!(xSelfLoc > canvasH || xSelfLoc < 30) && !(ySelfLoc > canvasW || ySelfLoc < 30)){
//            lastLocation = self.center
//        }
    }
}