//
//  KSideMenuVC.swift
//  SideMenuSwiftDemo
//
//  Created by Kiran Patel on 1/2/16.
//  Copyright © 2016  SOTSYS175. All rights reserved.
//

import Foundation
import UIKit

class KSideMenuVC: UIViewController,UIGestureRecognizerDelegate {
    
    var mainContainer : UIViewController?
    var menuContainer : UIViewController?
    var menuViewController : UIViewController?
    var mainViewController : UIViewController?
    var bgImageContainer : UIImageView?
    var distanceOpenMenu : CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       setUp()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func setUp(){
        self.distanceOpenMenu = self.view.frame.size.width-(self.view.frame.size.width/4);
        self.view.backgroundColor = UIColor.whiteColor();
        self.menuContainer = UIViewController()
        self.menuContainer!.view.layer.anchorPoint = CGPointMake(1.0, 0.5);
        self.menuContainer!.view.frame = self.view.bounds;
        self.menuContainer!.view.backgroundColor = UIColor.clearColor();
        self.addChildViewController(self.menuContainer!)
        self.view.addSubview((self.menuContainer?.view)!)
        self.menuContainer?.didMoveToParentViewController(self)
        
         self.mainContainer = UIViewController()
        self.mainContainer!.view.frame = self.view.bounds;
        self.mainContainer!.view.backgroundColor = UIColor.clearColor();
        self.addChildViewController(self.mainContainer!)
        self.view.addSubview((self.mainContainer?.view)!)
        self.mainContainer?.didMoveToParentViewController(self)

    }
    func setMenuViewController(menuVC : UIViewController)()->Void{
        if (self.menuViewController != nil) {
            self.menuViewController?.willMoveToParentViewController(nil)
            self.menuViewController?.removeFromParentViewController()
            self.menuViewController?.view.removeFromSuperview()
        }
        
        self.menuViewController = menuVC;
        self.menuViewController!.view.frame = self.view.bounds;
        self.menuContainer?.addChildViewController(self.menuViewController!)
        self.menuContainer?.view.addSubview(menuVC.view)
        self.menuContainer?.didMoveToParentViewController(self.menuViewController)
    }
    func setMainViewController(mainVC : UIViewController)()->Void{
        if (self.mainViewController == mainVC) {
            if (CGRectGetMinX(self.mainContainer!.view.frame) == self.distanceOpenMenu) {
                closeMenu()
            }
        }
        if (self.mainViewController != nil) {
            self.mainViewController?.willMoveToParentViewController(nil)
            self.mainViewController?.removeFromParentViewController()
            self.mainViewController?.view.removeFromSuperview()
        }
        self.mainViewController = mainVC;
        self.mainViewController!.view.frame = self.view.bounds;
        self.mainContainer?.addChildViewController(self.mainViewController!)
        self.mainContainer?.view.addSubview(self.mainViewController!.view)
        self.mainViewController?.didMoveToParentViewController(self.mainContainer)
      
        if (CGRectGetMinX(self.mainContainer!.view.frame) == self.distanceOpenMenu) {
            closeMenu()
        }
    }
    func openMenu(){
        addTapGestures()
        var fMain : CGRect = self.mainContainer!.view.frame
        fMain.origin.x = self.distanceOpenMenu;
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                self.mainContainer!.view.frame = fMain
            
            }) { (finished: Bool) -> Void in
                
        }
    }
    func closeMenu(){
        var fMain : CGRect = self.mainContainer!.view.frame
        fMain.origin.x = 0
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.mainContainer!.view.frame = fMain
            
            }) { (finished: Bool) -> Void in
                
        }
    }
    func addTapGestures(){
    let tapGestureRecognizer : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapMainAction")
        
     self.mainContainer!.view.addGestureRecognizer(tapGestureRecognizer)
    }
    func tapMainAction(){
        closeMenu()
    }
    func toggleMenu(){
        let fMain : CGRect = self.mainContainer!.view.frame
        if (CGRectGetMinX(fMain) == self.distanceOpenMenu) {
           closeMenu()
        }else{
           openMenu()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}