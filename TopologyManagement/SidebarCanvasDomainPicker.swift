//
//  SidebarCanvasDomainPicker.swift
//  TopologyManagement
//
//  Created by Mark Anthony Elbambo on 4/6/15.
//  Copyright (c) 2015 Narra Systems Corp. All rights reserved.
//
import UIKit

class SidebarCanvasDomainPicker: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var picker = UIPickerView()
    var doms = ["Default","Manila","Bangalore"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return doms.count
    }
    func  pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(doms[row])"
    }
}