//
//  SideMenuVC.swift
//  SideMenuSwiftDemo
//
//  Created by Kiran Patel on 1/2/16.
//  Copyright © 2016  SOTSYS175. All rights reserved.
//

import Foundation
import UIKit
class SideMenuVC: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    let aData : NSArray = ["First","Second","Third"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let aCell = tableView.dequeueReusableCellWithIdentifier(
            "kCell", forIndexPath: indexPath)
        let aLabel : UILabel = aCell.viewWithTag(10) as! UILabel
        aLabel.text = aData[indexPath.row] as? String
        return aCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            kConstantObj.SetIntialMainViewController("firstVC") // firstVC is storyboard ID
        }else if indexPath.row == 1 {
            kConstantObj.SetIntialMainViewController("secondVC")
        }else if indexPath.row == 2 {
            kConstantObj.SetIntialMainViewController("thirdVC")
        }
    }
}
