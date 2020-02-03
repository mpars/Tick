//
//  aboutViewController.swift
//  Tick
//
//  Created by mark on 27/11/2019.
//  Copyright © 2019 mark. All rights reserved.
//

import Cocoa

class aboutViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
    }
    
    override func viewWillAppear() {
           super.viewWillAppear()
        view.window?.level = .floating
    }
    
}
