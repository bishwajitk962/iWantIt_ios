//
//  RootControllerProxy.swift
//  Colorblind
//
//  Created by Bishwajit kumar on 12/12/23.
//

import UIKit
class RootControllerProxy{
    static let shared = RootControllerProxy()
    
    // MARK: - CLASS LIFE CYCLE
    private init() {
        
    }
    
    func setRoot(_ identifier : String , _ storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil) ){
        UIApplication.shared.removeCustomStatusBar()
        let story = storyBoard
        let vc = story.instantiateViewController(withIdentifier: "\(identifier)")
        let navVC = UINavigationController(rootViewController: vc)
        navVC.isNavigationBarHidden = true
        UIApplication.shared.windows.first?.rootViewController = navVC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func setRootViewController(_ identifier: String, strValue: String = "", storyboard: String) {
        if currentController.navigationController == nil {
            let storyBoard : UIStoryboard = UIStoryboard(name: storyboard, bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: identifier)
            nextViewController.title = strValue
            let navigationController = UINavigationController(rootViewController: nextViewController)
            navigationController.isNavigationBarHidden = true
            KAppDelegate?.window?.rootViewController = navigationController
        } else {
            guard let navigationController = currentController.navigationController else {return}
            if navigationController.viewControllers.count > 0 {
                currentController.navigationController!.viewControllers.removeAll()
                let storyBoard : UIStoryboard = UIStoryboard(name: storyboard, bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: identifier)
                nextViewController.title = strValue
                let navigationController = UINavigationController(rootViewController: nextViewController)
                navigationController.isNavigationBarHidden = true
                KAppDelegate?.window?.rootViewController = navigationController
            }
        }
    }
    func detectCurrentController() -> UIViewController {
        if let window = UIApplication.shared.delegate?.window {
            if var viewController = window?.rootViewController {
                // handle navigation controllers
                if(viewController is UINavigationController){
                    viewController = (viewController as! UINavigationController).visibleViewController!
                }
                return viewController
            }
        }
        return UIViewController()
    }
//    func gotoHome() {
//        UIApplication.shared.removeCustomStatusBar()
//        let vc = StoryBoard.tabBar.instantiateViewController(withIdentifier: "RoundedTabBarController") as! RoundedTabBarController
//        let navVC = UINavigationController(rootViewController: vc)
//        navVC.isNavigationBarHidden = true
//        UIApplication.shared.windows.first?.rootViewController = navVC
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
//    }

    
}
