//
//  AppFont.swift
//  TimeApp
//
//  Created by Bishwajit kumar on 12/12/23.
//  Copyright © 2020 Tina. All rights reserved.
//

import Foundation
import UIKit

//MARK: Enumeration
enum AppFont: String {
    
    case regular = "ProductSans-Regular"
    case bold = "ProductSans-Bold"
    case light = "ProductSans-Light"
    case medium = "ProductSans-Medium"
    case semiBold = "ProductSans-SemiBold"
    
    func fontWithSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}

enum AppColor{
    static let appOrange = UIColor(named: "AppOrange")
    static let fontGrey = UIColor(named: "AppFontGrey")
    static let appBlue = UIColor(named: "AppBlue")
    static let shadowGrey = UIColor(named: "ShadowBack")
    static let voilet = UIColor(named: "AppVoilet")
    static let green = UIColor(named: "AppGreen")
    static let backGround = UIColor(named: "AppBlack")
    static let boxGrey = UIColor(named: "BoxGrey")
    static let unselectedText = UIColor(named: "UnselectedBtn")
    static let appRed = UIColor(named: "AppPurpleClr")
    static let appWhite = UIColor(named: "AppWhite")
    static let appYellow = UIColor(named: "AppYellow")
    static let appBlack = UIColor(named: "AppBlack")
    static let appGray = UIColor(named: "AppGray")
    static let appLightGray = UIColor(named: "AppLightGray")
    static let appDarkGray = UIColor(named: "AppDarkGray")
    static let appred = UIColor(named: "AppRed")
    static let appGreen = UIColor(named: "AppGreen")
    static let appLightGrayColor = UIColor(named: "AppLightGrayColor")
    static let appRedClr = UIColor(named: "AppRedClr")
    static let appLightGreen = UIColor(named: "AppLightGreen")
    static let appLightRed = UIColor(named: "AppLightRed")
    static let appDarkYellow = UIColor(named: "AppDarkYellow")
}

enum StoryBoard{
    //Bundle.main
    static let main = UIStoryboard(name: "Main", bundle: nil)
    static let profile = UIStoryboard(name: "Profile", bundle: nil)
    static let home = UIStoryboard(name: "Home", bundle: nil)
    static let setting = UIStoryboard(name: "Setting", bundle: nil)
    static let tab = UIStoryboard(name: "Tab", bundle: Bundle.main)
    static let messages = UIStoryboard(name: "Messages", bundle: nil)
    static let centerMenu = UIStoryboard(name: "CenterMenu", bundle: nil)
    static let chat = UIStoryboard(name: "Chat", bundle: nil)
    static let market = UIStoryboard(name: "Market", bundle: nil)
}

extension UIStoryboard {
    static func loadFromStoryboard(_ identifier: String, storyboard: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
        return vc
    }
}
enum Storyboards: String {
    case main = "Main"
    case profile = "Profile"
    case setting = "Setting"
    case tab = "Tab"
    case messages = "Messages"
    case centerMenu = "CenterMenu"
   
}
