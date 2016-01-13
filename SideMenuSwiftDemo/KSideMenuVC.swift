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
        self.distanceOpenMenu = self.view.frame.size.width-(self.view.frame.size.width/3);
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
        closeMenu()

//        if (self.mainViewController == mainVC) {
//            if (CGRectGetMinX(self.mainContainer!.view.frame) == self.distanceOpenMenu) {
//                closeMenu()
//            }
//        }
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
        //Simple Open Menu
        /*
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                self.mainContainer!.view.frame = fMain
            
            }) { (finished: Bool) -> Void in
                
        }*/

        UIView.animateWithDuration(0.7, delay: 0.0, options: UIViewAnimationOptions.BeginFromCurrentState, animations: { () -> Void in
            let layerTemp : CALayer = (self.mainContainer?.view.layer)!
            layerTemp.zPosition = 1000
            var tRotate : CATransform3D = CATransform3DIdentity
            tRotate.m34 = 1.0/(-500)
            let aXpos: CGFloat = CGFloat(-20.0*(M_PI/180))
            tRotate = CATransform3DRotate(tRotate,aXpos, 0, 1, 0)
            var tScale : CATransform3D = CATransform3DIdentity
            tScale.m34 = 1.0/(-500)
            tScale = CATransform3DScale(tScale, 0.8, 0.8, 1.0);
            layerTemp.transform = CATransform3DConcat(tScale, tRotate)
            
            self.mainContainer?.view.frame = fMain
            }) { (finished: Bool) -> Void in
        }
    }
    func closeMenu(){
        var fMain : CGRect = self.mainContainer!.view.frame
        fMain.origin.x = 0
        /*
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.mainContainer!.view.frame = fMain
            
            }) { (finished: Bool) -> Void in
                
        }*/

        UIView.animateWithDuration(0.7, delay: 0.0, options: UIViewAnimationOptions.BeginFromCurrentState, animations: { () -> Void in
            self.mainContainer?.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
            let layerTemp : CALayer = (self.mainContainer?.view.layer)!
            layerTemp.zPosition = 1000
            var tRotate : CATransform3D = CATransform3DIdentity
            tRotate.m34 = 1.0/(-500)
            let aXpos: CGFloat = CGFloat(0.0*(M_PI/180))
            tRotate = CATransform3DRotate(tRotate,aXpos, 0, 1, 0)
              layerTemp.transform = tRotate
            var tScale : CATransform3D = CATransform3DIdentity
            tScale.m34 = 1.0/(-500)
            tScale = CATransform3DScale(tScale,1.0, 1.0, 1.0);
            layerTemp.transform = tScale;
            layerTemp.transform = CATransform3DConcat(tRotate, tScale)
            layerTemp.transform = CATransform3DConcat(tScale, tRotate)
            self.mainContainer!.view.frame = CGRectMake(0, 0, appDelegate.window!.frame.size.width, appDelegate.window!.frame.size.height)
            }) { (finished: Bool) -> Void in
                self.mainViewController!.view.userInteractionEnabled = true

        }
    }
    func addTapGestures(){
        self.mainViewController!.view.userInteractionEnabled = false

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