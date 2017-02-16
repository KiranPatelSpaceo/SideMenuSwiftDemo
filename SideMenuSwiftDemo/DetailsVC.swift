//
//  DetailsVC.swift
//  SideMenuSwiftDemo
//
//  Created by Kiran Patel on 1/2/16.
//  Copyright © 2016  SOTSYS175. All rights reserved.
//

import Foundation
import UIKit
class DetailsVC: UIViewController {
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kCell", for: indexPath) 
        configureCell(cell, forRowAtIndexPath: indexPath)

        return cell
    }
    
    func configureCell(_ cell: UITableViewCell, forRowAtIndexPath: IndexPath) {
        
    }
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        print("Didselect")
    }
    
   

    @IBAction func btnBackPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
