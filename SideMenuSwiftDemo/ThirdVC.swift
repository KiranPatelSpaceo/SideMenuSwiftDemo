//
//  ThirdVC.swift
//  SideMenuSwiftDemo
//
//  Created by Kiran Patel on 1/2/16.
//  Copyright © 2016  SOTSYS175. All rights reserved.
//

import Foundation
import UIKit
class ThirdVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func btnSideMenuPressed(_ sender: UIButton) {
        sideMenuVC.toggleMenu()
    }
}
