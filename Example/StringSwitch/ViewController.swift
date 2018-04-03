//
//  ViewController.swift
//  StringSwitch
//
//  Created by chocovayashi on 04/03/2018.
//  Copyright (c) 2018 chocovayashi. All rights reserved.
//

import UIKit
import StringSwitch

class ViewController: UIViewController {
    
    @IBOutlet weak var stringSwitch: StringSwitch!
    
    override func viewDidLoad() {
        stringSwitch.selectedStringColor = .white
        stringSwitch.notSelectedStringColor = .black
        
        stringSwitch.selectedBackgroundColor = .black
        stringSwitch.notSelectedBackgroundColor = .white
        
        stringSwitch.rightString = NSAttributedString(string: "ON")
        stringSwitch.leftString = NSAttributedString(string: "Off")
    }
    
}

