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
        self.view.backgroundColor = UIColor.white;
        self.menuContainer = UIViewController()
        self.menuContainer!.view.layer.anchorPoint = CGPoint(x: 1.0, y: 0.5);
        self.menuContainer!.view.frame = self.view.bounds;
        self.menuContainer!.view.backgroundColor = UIColor.clear;
        self.addChildViewController(self.menuContainer!)
        self.view.addSubview((self.menuContainer?.view)!)
        self.menuContainer?.didMove(toParentViewController: self)
        
         self.mainContainer = UIViewController()
        self.mainContainer!.view.frame = self.view.bounds;
        self.mainContainer!.view.backgroundColor = UIColor.clear;
        self.addChildViewController(self.mainContainer!)
        self.view.addSubview((self.mainContainer?.view)!)
        self.mainContainer?.didMove(toParentViewController: self)

    }
    func menuViewController(_ menuVC : UIViewController)
    {
        if (self.menuViewController != nil) {
            self.menuViewController?.willMove(toParentViewController: nil)
            self.menuViewController?.removeFromParentViewController()
            self.menuViewController?.view.removeFromSuperview()
        }
        
        self.menuViewController = menuVC;
        self.menuViewController!.view.frame = self.view.bounds;
        self.menuContainer?.addChildViewController(self.menuViewController!)
        self.menuContainer?.view.addSubview(menuVC.view)
        self.menuContainer?.didMove(toParentViewController: self.menuViewController)
    }
    func mainViewController(_ mainVC : UIViewController)
    {
        closeMenu()

//        if (self.mainViewController == mainVC) {
//            if (CGRectGetMinX(self.mainContainer!.view.frame) == self.distanceOpenMenu) {
//                closeMenu()
//            }
//        }
        if (self.mainViewController != nil) {
            self.mainViewController?.willMove(toParentViewController: nil)
            self.mainViewController?.removeFromParentViewController()
            self.mainViewController?.view.removeFromSuperview()
        }
        self.mainViewController = mainVC;
        self.mainViewController!.view.frame = self.view.bounds;
        self.mainContainer?.addChildViewController(self.mainViewController!)
        self.mainContainer?.view.addSubview(self.mainViewController!.view)
        self.mainViewController?.didMove(toParentViewController: self.mainContainer)
      
        if (self.mainContainer!.view.frame.minX == self.distanceOpenMenu) {
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

        UIView.animate(withDuration: 0.7, delay: 0.0, options: UIViewAnimationOptions.beginFromCurrentState, animations: { () -> Void in
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

        UIView.animate(withDuration: 0.7, delay: 0.0, options: UIViewAnimationOptions.beginFromCurrentState, animations: { () -> Void in
            self.mainContainer?.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
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
            self.mainContainer!.view.frame = CGRect(x: 0, y: 0, width: appDelegate.window!.frame.size.width, height: appDelegate.window!.frame.size.height)
            }) { (finished: Bool) -> Void in
                self.mainViewController!.view.isUserInteractionEnabled = true
                self.removeGesture()

        }
    }
    func addTapGestures(){
        self.mainViewController!.view.isUserInteractionEnabled = false

        let tapGestureRecognizer : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KSideMenuVC.tapMainAction))
        self.mainContainer!.view.addGestureRecognizer(tapGestureRecognizer)
    }
    func removeGesture(){
        for recognizer in  self.mainContainer!.view.gestureRecognizers ?? [] {
            if (recognizer .isKind(of: UITapGestureRecognizer.self)){
                self.mainContainer!.view.removeGestureRecognizer(recognizer)
            }
        }
    }
    func tapMainAction(){
        closeMenu()
    }
    func toggleMenu(){
        let fMain : CGRect = self.mainContainer!.view.frame
        if (fMain.minX == self.distanceOpenMenu) {
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
