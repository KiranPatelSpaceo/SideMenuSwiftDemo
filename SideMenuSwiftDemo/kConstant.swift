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

class kConstant {
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)

    func SetIntialMainViewController(aStoryBoardID: String)->(KSideMenuVC){
        let sideMenuObj = mainStoryboard.instantiateViewControllerWithIdentifier("sideMenuID")
        let mainVcObj = mainStoryboard.instantiateViewControllerWithIdentifier(aStoryBoardID)
        let navigationController : UINavigationController = UINavigationController(rootViewController: mainVcObj)
        navigationController.navigationBarHidden = true
        sideMenuVC.view.frame = UIScreen.mainScreen().bounds
        sideMenuVC.setMainViewController(navigationController)()
        sideMenuVC.setMenuViewController(sideMenuObj)()
        return sideMenuVC
    }
    func SetMainViewController(aStoryBoardID: String)->(KSideMenuVC){
        let mainVcObj = mainStoryboard.instantiateViewControllerWithIdentifier(aStoryBoardID)
        let navigationController : UINavigationController = UINavigationController(rootViewController: mainVcObj)
        navigationController.navigationBarHidden = true
        sideMenuVC.view.frame = UIScreen.mainScreen().bounds
        sideMenuVC.setMainViewController(navigationController)()
        return sideMenuVC
    }
   
    // let sideMenuVC = KSideMenuVC()
    
}