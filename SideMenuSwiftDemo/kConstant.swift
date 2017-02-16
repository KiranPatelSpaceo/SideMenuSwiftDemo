//
//  kConstant.swift
//  SideMenuSwiftDemo
//
//  Created by Kiran Patel on 1/2/16.
//  Copyright © 2016  SOTSYS175. All rights reserved.
//

import Foundation
import UIKit
let sideMenuVC = KSideMenuVC()
let appDelegate = UIApplication.shared.delegate as! AppDelegate

class kConstant {
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)

    func SetIntialMainViewController(_ aStoryBoardID: String)->(KSideMenuVC){
        let sideMenuObj = mainStoryboard.instantiateViewController(withIdentifier: "sideMenuID")
        let mainVcObj = mainStoryboard.instantiateViewController(withIdentifier: aStoryBoardID)
        let navigationController : UINavigationController = UINavigationController(rootViewController: mainVcObj)
        navigationController.isNavigationBarHidden = true
        sideMenuVC.view.frame = UIScreen.main.bounds
        sideMenuVC.mainViewController(navigationController)
        sideMenuVC.menuViewController(sideMenuObj)
        return sideMenuVC
    }
    func SetMainViewController(_ aStoryBoardID: String)->(KSideMenuVC){
        let mainVcObj = mainStoryboard.instantiateViewController(withIdentifier: aStoryBoardID)
        let navigationController : UINavigationController = UINavigationController(rootViewController: mainVcObj)
        navigationController.isNavigationBarHidden = true
        sideMenuVC.view.frame = UIScreen.main.bounds
        sideMenuVC.mainViewController(navigationController)
        return sideMenuVC
    }
   
    // let sideMenuVC = KSideMenuVC()
    
}
